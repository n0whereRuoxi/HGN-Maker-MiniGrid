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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_49434 - SURFACE
      ?auto_49435 - SURFACE
    )
    :vars
    (
      ?auto_49436 - HOIST
      ?auto_49437 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_49436 ?auto_49437 ) ( SURFACE-AT ?auto_49434 ?auto_49437 ) ( CLEAR ?auto_49434 ) ( LIFTING ?auto_49436 ?auto_49435 ) ( IS-CRATE ?auto_49435 ) ( not ( = ?auto_49434 ?auto_49435 ) ) )
    :subtasks
    ( ( !DROP ?auto_49436 ?auto_49435 ?auto_49434 ?auto_49437 )
      ( MAKE-1CRATE-VERIFY ?auto_49434 ?auto_49435 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_49438 - SURFACE
      ?auto_49439 - SURFACE
    )
    :vars
    (
      ?auto_49440 - HOIST
      ?auto_49441 - PLACE
      ?auto_49442 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_49440 ?auto_49441 ) ( SURFACE-AT ?auto_49438 ?auto_49441 ) ( CLEAR ?auto_49438 ) ( IS-CRATE ?auto_49439 ) ( not ( = ?auto_49438 ?auto_49439 ) ) ( TRUCK-AT ?auto_49442 ?auto_49441 ) ( AVAILABLE ?auto_49440 ) ( IN ?auto_49439 ?auto_49442 ) )
    :subtasks
    ( ( !UNLOAD ?auto_49440 ?auto_49439 ?auto_49442 ?auto_49441 )
      ( MAKE-1CRATE ?auto_49438 ?auto_49439 )
      ( MAKE-1CRATE-VERIFY ?auto_49438 ?auto_49439 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_49443 - SURFACE
      ?auto_49444 - SURFACE
    )
    :vars
    (
      ?auto_49446 - HOIST
      ?auto_49445 - PLACE
      ?auto_49447 - TRUCK
      ?auto_49448 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_49446 ?auto_49445 ) ( SURFACE-AT ?auto_49443 ?auto_49445 ) ( CLEAR ?auto_49443 ) ( IS-CRATE ?auto_49444 ) ( not ( = ?auto_49443 ?auto_49444 ) ) ( AVAILABLE ?auto_49446 ) ( IN ?auto_49444 ?auto_49447 ) ( TRUCK-AT ?auto_49447 ?auto_49448 ) ( not ( = ?auto_49448 ?auto_49445 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_49447 ?auto_49448 ?auto_49445 )
      ( MAKE-1CRATE ?auto_49443 ?auto_49444 )
      ( MAKE-1CRATE-VERIFY ?auto_49443 ?auto_49444 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_49449 - SURFACE
      ?auto_49450 - SURFACE
    )
    :vars
    (
      ?auto_49452 - HOIST
      ?auto_49451 - PLACE
      ?auto_49454 - TRUCK
      ?auto_49453 - PLACE
      ?auto_49455 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_49452 ?auto_49451 ) ( SURFACE-AT ?auto_49449 ?auto_49451 ) ( CLEAR ?auto_49449 ) ( IS-CRATE ?auto_49450 ) ( not ( = ?auto_49449 ?auto_49450 ) ) ( AVAILABLE ?auto_49452 ) ( TRUCK-AT ?auto_49454 ?auto_49453 ) ( not ( = ?auto_49453 ?auto_49451 ) ) ( HOIST-AT ?auto_49455 ?auto_49453 ) ( LIFTING ?auto_49455 ?auto_49450 ) ( not ( = ?auto_49452 ?auto_49455 ) ) )
    :subtasks
    ( ( !LOAD ?auto_49455 ?auto_49450 ?auto_49454 ?auto_49453 )
      ( MAKE-1CRATE ?auto_49449 ?auto_49450 )
      ( MAKE-1CRATE-VERIFY ?auto_49449 ?auto_49450 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_49456 - SURFACE
      ?auto_49457 - SURFACE
    )
    :vars
    (
      ?auto_49462 - HOIST
      ?auto_49460 - PLACE
      ?auto_49458 - TRUCK
      ?auto_49459 - PLACE
      ?auto_49461 - HOIST
      ?auto_49463 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_49462 ?auto_49460 ) ( SURFACE-AT ?auto_49456 ?auto_49460 ) ( CLEAR ?auto_49456 ) ( IS-CRATE ?auto_49457 ) ( not ( = ?auto_49456 ?auto_49457 ) ) ( AVAILABLE ?auto_49462 ) ( TRUCK-AT ?auto_49458 ?auto_49459 ) ( not ( = ?auto_49459 ?auto_49460 ) ) ( HOIST-AT ?auto_49461 ?auto_49459 ) ( not ( = ?auto_49462 ?auto_49461 ) ) ( AVAILABLE ?auto_49461 ) ( SURFACE-AT ?auto_49457 ?auto_49459 ) ( ON ?auto_49457 ?auto_49463 ) ( CLEAR ?auto_49457 ) ( not ( = ?auto_49456 ?auto_49463 ) ) ( not ( = ?auto_49457 ?auto_49463 ) ) )
    :subtasks
    ( ( !LIFT ?auto_49461 ?auto_49457 ?auto_49463 ?auto_49459 )
      ( MAKE-1CRATE ?auto_49456 ?auto_49457 )
      ( MAKE-1CRATE-VERIFY ?auto_49456 ?auto_49457 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_49464 - SURFACE
      ?auto_49465 - SURFACE
    )
    :vars
    (
      ?auto_49466 - HOIST
      ?auto_49471 - PLACE
      ?auto_49467 - PLACE
      ?auto_49470 - HOIST
      ?auto_49469 - SURFACE
      ?auto_49468 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_49466 ?auto_49471 ) ( SURFACE-AT ?auto_49464 ?auto_49471 ) ( CLEAR ?auto_49464 ) ( IS-CRATE ?auto_49465 ) ( not ( = ?auto_49464 ?auto_49465 ) ) ( AVAILABLE ?auto_49466 ) ( not ( = ?auto_49467 ?auto_49471 ) ) ( HOIST-AT ?auto_49470 ?auto_49467 ) ( not ( = ?auto_49466 ?auto_49470 ) ) ( AVAILABLE ?auto_49470 ) ( SURFACE-AT ?auto_49465 ?auto_49467 ) ( ON ?auto_49465 ?auto_49469 ) ( CLEAR ?auto_49465 ) ( not ( = ?auto_49464 ?auto_49469 ) ) ( not ( = ?auto_49465 ?auto_49469 ) ) ( TRUCK-AT ?auto_49468 ?auto_49471 ) )
    :subtasks
    ( ( !DRIVE ?auto_49468 ?auto_49471 ?auto_49467 )
      ( MAKE-1CRATE ?auto_49464 ?auto_49465 )
      ( MAKE-1CRATE-VERIFY ?auto_49464 ?auto_49465 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_49481 - SURFACE
      ?auto_49482 - SURFACE
      ?auto_49483 - SURFACE
    )
    :vars
    (
      ?auto_49485 - HOIST
      ?auto_49484 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_49485 ?auto_49484 ) ( SURFACE-AT ?auto_49482 ?auto_49484 ) ( CLEAR ?auto_49482 ) ( LIFTING ?auto_49485 ?auto_49483 ) ( IS-CRATE ?auto_49483 ) ( not ( = ?auto_49482 ?auto_49483 ) ) ( ON ?auto_49482 ?auto_49481 ) ( not ( = ?auto_49481 ?auto_49482 ) ) ( not ( = ?auto_49481 ?auto_49483 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_49482 ?auto_49483 )
      ( MAKE-2CRATE-VERIFY ?auto_49481 ?auto_49482 ?auto_49483 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_49491 - SURFACE
      ?auto_49492 - SURFACE
      ?auto_49493 - SURFACE
    )
    :vars
    (
      ?auto_49496 - HOIST
      ?auto_49495 - PLACE
      ?auto_49494 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_49496 ?auto_49495 ) ( SURFACE-AT ?auto_49492 ?auto_49495 ) ( CLEAR ?auto_49492 ) ( IS-CRATE ?auto_49493 ) ( not ( = ?auto_49492 ?auto_49493 ) ) ( TRUCK-AT ?auto_49494 ?auto_49495 ) ( AVAILABLE ?auto_49496 ) ( IN ?auto_49493 ?auto_49494 ) ( ON ?auto_49492 ?auto_49491 ) ( not ( = ?auto_49491 ?auto_49492 ) ) ( not ( = ?auto_49491 ?auto_49493 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_49492 ?auto_49493 )
      ( MAKE-2CRATE-VERIFY ?auto_49491 ?auto_49492 ?auto_49493 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_49497 - SURFACE
      ?auto_49498 - SURFACE
    )
    :vars
    (
      ?auto_49500 - HOIST
      ?auto_49499 - PLACE
      ?auto_49502 - TRUCK
      ?auto_49501 - SURFACE
      ?auto_49503 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_49500 ?auto_49499 ) ( SURFACE-AT ?auto_49497 ?auto_49499 ) ( CLEAR ?auto_49497 ) ( IS-CRATE ?auto_49498 ) ( not ( = ?auto_49497 ?auto_49498 ) ) ( AVAILABLE ?auto_49500 ) ( IN ?auto_49498 ?auto_49502 ) ( ON ?auto_49497 ?auto_49501 ) ( not ( = ?auto_49501 ?auto_49497 ) ) ( not ( = ?auto_49501 ?auto_49498 ) ) ( TRUCK-AT ?auto_49502 ?auto_49503 ) ( not ( = ?auto_49503 ?auto_49499 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_49502 ?auto_49503 ?auto_49499 )
      ( MAKE-2CRATE ?auto_49501 ?auto_49497 ?auto_49498 )
      ( MAKE-1CRATE-VERIFY ?auto_49497 ?auto_49498 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_49504 - SURFACE
      ?auto_49505 - SURFACE
      ?auto_49506 - SURFACE
    )
    :vars
    (
      ?auto_49509 - HOIST
      ?auto_49508 - PLACE
      ?auto_49507 - TRUCK
      ?auto_49510 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_49509 ?auto_49508 ) ( SURFACE-AT ?auto_49505 ?auto_49508 ) ( CLEAR ?auto_49505 ) ( IS-CRATE ?auto_49506 ) ( not ( = ?auto_49505 ?auto_49506 ) ) ( AVAILABLE ?auto_49509 ) ( IN ?auto_49506 ?auto_49507 ) ( ON ?auto_49505 ?auto_49504 ) ( not ( = ?auto_49504 ?auto_49505 ) ) ( not ( = ?auto_49504 ?auto_49506 ) ) ( TRUCK-AT ?auto_49507 ?auto_49510 ) ( not ( = ?auto_49510 ?auto_49508 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_49505 ?auto_49506 )
      ( MAKE-2CRATE-VERIFY ?auto_49504 ?auto_49505 ?auto_49506 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_49511 - SURFACE
      ?auto_49512 - SURFACE
    )
    :vars
    (
      ?auto_49517 - HOIST
      ?auto_49513 - PLACE
      ?auto_49516 - SURFACE
      ?auto_49514 - TRUCK
      ?auto_49515 - PLACE
      ?auto_49518 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_49517 ?auto_49513 ) ( SURFACE-AT ?auto_49511 ?auto_49513 ) ( CLEAR ?auto_49511 ) ( IS-CRATE ?auto_49512 ) ( not ( = ?auto_49511 ?auto_49512 ) ) ( AVAILABLE ?auto_49517 ) ( ON ?auto_49511 ?auto_49516 ) ( not ( = ?auto_49516 ?auto_49511 ) ) ( not ( = ?auto_49516 ?auto_49512 ) ) ( TRUCK-AT ?auto_49514 ?auto_49515 ) ( not ( = ?auto_49515 ?auto_49513 ) ) ( HOIST-AT ?auto_49518 ?auto_49515 ) ( LIFTING ?auto_49518 ?auto_49512 ) ( not ( = ?auto_49517 ?auto_49518 ) ) )
    :subtasks
    ( ( !LOAD ?auto_49518 ?auto_49512 ?auto_49514 ?auto_49515 )
      ( MAKE-2CRATE ?auto_49516 ?auto_49511 ?auto_49512 )
      ( MAKE-1CRATE-VERIFY ?auto_49511 ?auto_49512 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_49519 - SURFACE
      ?auto_49520 - SURFACE
      ?auto_49521 - SURFACE
    )
    :vars
    (
      ?auto_49522 - HOIST
      ?auto_49526 - PLACE
      ?auto_49525 - TRUCK
      ?auto_49524 - PLACE
      ?auto_49523 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_49522 ?auto_49526 ) ( SURFACE-AT ?auto_49520 ?auto_49526 ) ( CLEAR ?auto_49520 ) ( IS-CRATE ?auto_49521 ) ( not ( = ?auto_49520 ?auto_49521 ) ) ( AVAILABLE ?auto_49522 ) ( ON ?auto_49520 ?auto_49519 ) ( not ( = ?auto_49519 ?auto_49520 ) ) ( not ( = ?auto_49519 ?auto_49521 ) ) ( TRUCK-AT ?auto_49525 ?auto_49524 ) ( not ( = ?auto_49524 ?auto_49526 ) ) ( HOIST-AT ?auto_49523 ?auto_49524 ) ( LIFTING ?auto_49523 ?auto_49521 ) ( not ( = ?auto_49522 ?auto_49523 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_49520 ?auto_49521 )
      ( MAKE-2CRATE-VERIFY ?auto_49519 ?auto_49520 ?auto_49521 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_49527 - SURFACE
      ?auto_49528 - SURFACE
    )
    :vars
    (
      ?auto_49530 - HOIST
      ?auto_49534 - PLACE
      ?auto_49529 - SURFACE
      ?auto_49531 - TRUCK
      ?auto_49533 - PLACE
      ?auto_49532 - HOIST
      ?auto_49535 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_49530 ?auto_49534 ) ( SURFACE-AT ?auto_49527 ?auto_49534 ) ( CLEAR ?auto_49527 ) ( IS-CRATE ?auto_49528 ) ( not ( = ?auto_49527 ?auto_49528 ) ) ( AVAILABLE ?auto_49530 ) ( ON ?auto_49527 ?auto_49529 ) ( not ( = ?auto_49529 ?auto_49527 ) ) ( not ( = ?auto_49529 ?auto_49528 ) ) ( TRUCK-AT ?auto_49531 ?auto_49533 ) ( not ( = ?auto_49533 ?auto_49534 ) ) ( HOIST-AT ?auto_49532 ?auto_49533 ) ( not ( = ?auto_49530 ?auto_49532 ) ) ( AVAILABLE ?auto_49532 ) ( SURFACE-AT ?auto_49528 ?auto_49533 ) ( ON ?auto_49528 ?auto_49535 ) ( CLEAR ?auto_49528 ) ( not ( = ?auto_49527 ?auto_49535 ) ) ( not ( = ?auto_49528 ?auto_49535 ) ) ( not ( = ?auto_49529 ?auto_49535 ) ) )
    :subtasks
    ( ( !LIFT ?auto_49532 ?auto_49528 ?auto_49535 ?auto_49533 )
      ( MAKE-2CRATE ?auto_49529 ?auto_49527 ?auto_49528 )
      ( MAKE-1CRATE-VERIFY ?auto_49527 ?auto_49528 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_49536 - SURFACE
      ?auto_49537 - SURFACE
      ?auto_49538 - SURFACE
    )
    :vars
    (
      ?auto_49541 - HOIST
      ?auto_49542 - PLACE
      ?auto_49540 - TRUCK
      ?auto_49543 - PLACE
      ?auto_49539 - HOIST
      ?auto_49544 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_49541 ?auto_49542 ) ( SURFACE-AT ?auto_49537 ?auto_49542 ) ( CLEAR ?auto_49537 ) ( IS-CRATE ?auto_49538 ) ( not ( = ?auto_49537 ?auto_49538 ) ) ( AVAILABLE ?auto_49541 ) ( ON ?auto_49537 ?auto_49536 ) ( not ( = ?auto_49536 ?auto_49537 ) ) ( not ( = ?auto_49536 ?auto_49538 ) ) ( TRUCK-AT ?auto_49540 ?auto_49543 ) ( not ( = ?auto_49543 ?auto_49542 ) ) ( HOIST-AT ?auto_49539 ?auto_49543 ) ( not ( = ?auto_49541 ?auto_49539 ) ) ( AVAILABLE ?auto_49539 ) ( SURFACE-AT ?auto_49538 ?auto_49543 ) ( ON ?auto_49538 ?auto_49544 ) ( CLEAR ?auto_49538 ) ( not ( = ?auto_49537 ?auto_49544 ) ) ( not ( = ?auto_49538 ?auto_49544 ) ) ( not ( = ?auto_49536 ?auto_49544 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_49537 ?auto_49538 )
      ( MAKE-2CRATE-VERIFY ?auto_49536 ?auto_49537 ?auto_49538 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_49545 - SURFACE
      ?auto_49546 - SURFACE
    )
    :vars
    (
      ?auto_49547 - HOIST
      ?auto_49553 - PLACE
      ?auto_49548 - SURFACE
      ?auto_49551 - PLACE
      ?auto_49550 - HOIST
      ?auto_49549 - SURFACE
      ?auto_49552 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_49547 ?auto_49553 ) ( SURFACE-AT ?auto_49545 ?auto_49553 ) ( CLEAR ?auto_49545 ) ( IS-CRATE ?auto_49546 ) ( not ( = ?auto_49545 ?auto_49546 ) ) ( AVAILABLE ?auto_49547 ) ( ON ?auto_49545 ?auto_49548 ) ( not ( = ?auto_49548 ?auto_49545 ) ) ( not ( = ?auto_49548 ?auto_49546 ) ) ( not ( = ?auto_49551 ?auto_49553 ) ) ( HOIST-AT ?auto_49550 ?auto_49551 ) ( not ( = ?auto_49547 ?auto_49550 ) ) ( AVAILABLE ?auto_49550 ) ( SURFACE-AT ?auto_49546 ?auto_49551 ) ( ON ?auto_49546 ?auto_49549 ) ( CLEAR ?auto_49546 ) ( not ( = ?auto_49545 ?auto_49549 ) ) ( not ( = ?auto_49546 ?auto_49549 ) ) ( not ( = ?auto_49548 ?auto_49549 ) ) ( TRUCK-AT ?auto_49552 ?auto_49553 ) )
    :subtasks
    ( ( !DRIVE ?auto_49552 ?auto_49553 ?auto_49551 )
      ( MAKE-2CRATE ?auto_49548 ?auto_49545 ?auto_49546 )
      ( MAKE-1CRATE-VERIFY ?auto_49545 ?auto_49546 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_49554 - SURFACE
      ?auto_49555 - SURFACE
      ?auto_49556 - SURFACE
    )
    :vars
    (
      ?auto_49562 - HOIST
      ?auto_49558 - PLACE
      ?auto_49560 - PLACE
      ?auto_49557 - HOIST
      ?auto_49559 - SURFACE
      ?auto_49561 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_49562 ?auto_49558 ) ( SURFACE-AT ?auto_49555 ?auto_49558 ) ( CLEAR ?auto_49555 ) ( IS-CRATE ?auto_49556 ) ( not ( = ?auto_49555 ?auto_49556 ) ) ( AVAILABLE ?auto_49562 ) ( ON ?auto_49555 ?auto_49554 ) ( not ( = ?auto_49554 ?auto_49555 ) ) ( not ( = ?auto_49554 ?auto_49556 ) ) ( not ( = ?auto_49560 ?auto_49558 ) ) ( HOIST-AT ?auto_49557 ?auto_49560 ) ( not ( = ?auto_49562 ?auto_49557 ) ) ( AVAILABLE ?auto_49557 ) ( SURFACE-AT ?auto_49556 ?auto_49560 ) ( ON ?auto_49556 ?auto_49559 ) ( CLEAR ?auto_49556 ) ( not ( = ?auto_49555 ?auto_49559 ) ) ( not ( = ?auto_49556 ?auto_49559 ) ) ( not ( = ?auto_49554 ?auto_49559 ) ) ( TRUCK-AT ?auto_49561 ?auto_49558 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_49555 ?auto_49556 )
      ( MAKE-2CRATE-VERIFY ?auto_49554 ?auto_49555 ?auto_49556 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_49563 - SURFACE
      ?auto_49564 - SURFACE
    )
    :vars
    (
      ?auto_49566 - HOIST
      ?auto_49567 - PLACE
      ?auto_49570 - SURFACE
      ?auto_49571 - PLACE
      ?auto_49565 - HOIST
      ?auto_49568 - SURFACE
      ?auto_49569 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_49566 ?auto_49567 ) ( IS-CRATE ?auto_49564 ) ( not ( = ?auto_49563 ?auto_49564 ) ) ( not ( = ?auto_49570 ?auto_49563 ) ) ( not ( = ?auto_49570 ?auto_49564 ) ) ( not ( = ?auto_49571 ?auto_49567 ) ) ( HOIST-AT ?auto_49565 ?auto_49571 ) ( not ( = ?auto_49566 ?auto_49565 ) ) ( AVAILABLE ?auto_49565 ) ( SURFACE-AT ?auto_49564 ?auto_49571 ) ( ON ?auto_49564 ?auto_49568 ) ( CLEAR ?auto_49564 ) ( not ( = ?auto_49563 ?auto_49568 ) ) ( not ( = ?auto_49564 ?auto_49568 ) ) ( not ( = ?auto_49570 ?auto_49568 ) ) ( TRUCK-AT ?auto_49569 ?auto_49567 ) ( SURFACE-AT ?auto_49570 ?auto_49567 ) ( CLEAR ?auto_49570 ) ( LIFTING ?auto_49566 ?auto_49563 ) ( IS-CRATE ?auto_49563 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_49570 ?auto_49563 )
      ( MAKE-2CRATE ?auto_49570 ?auto_49563 ?auto_49564 )
      ( MAKE-1CRATE-VERIFY ?auto_49563 ?auto_49564 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_49572 - SURFACE
      ?auto_49573 - SURFACE
      ?auto_49574 - SURFACE
    )
    :vars
    (
      ?auto_49576 - HOIST
      ?auto_49578 - PLACE
      ?auto_49577 - PLACE
      ?auto_49579 - HOIST
      ?auto_49575 - SURFACE
      ?auto_49580 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_49576 ?auto_49578 ) ( IS-CRATE ?auto_49574 ) ( not ( = ?auto_49573 ?auto_49574 ) ) ( not ( = ?auto_49572 ?auto_49573 ) ) ( not ( = ?auto_49572 ?auto_49574 ) ) ( not ( = ?auto_49577 ?auto_49578 ) ) ( HOIST-AT ?auto_49579 ?auto_49577 ) ( not ( = ?auto_49576 ?auto_49579 ) ) ( AVAILABLE ?auto_49579 ) ( SURFACE-AT ?auto_49574 ?auto_49577 ) ( ON ?auto_49574 ?auto_49575 ) ( CLEAR ?auto_49574 ) ( not ( = ?auto_49573 ?auto_49575 ) ) ( not ( = ?auto_49574 ?auto_49575 ) ) ( not ( = ?auto_49572 ?auto_49575 ) ) ( TRUCK-AT ?auto_49580 ?auto_49578 ) ( SURFACE-AT ?auto_49572 ?auto_49578 ) ( CLEAR ?auto_49572 ) ( LIFTING ?auto_49576 ?auto_49573 ) ( IS-CRATE ?auto_49573 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_49573 ?auto_49574 )
      ( MAKE-2CRATE-VERIFY ?auto_49572 ?auto_49573 ?auto_49574 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_49581 - SURFACE
      ?auto_49582 - SURFACE
    )
    :vars
    (
      ?auto_49589 - HOIST
      ?auto_49586 - PLACE
      ?auto_49585 - SURFACE
      ?auto_49588 - PLACE
      ?auto_49584 - HOIST
      ?auto_49583 - SURFACE
      ?auto_49587 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_49589 ?auto_49586 ) ( IS-CRATE ?auto_49582 ) ( not ( = ?auto_49581 ?auto_49582 ) ) ( not ( = ?auto_49585 ?auto_49581 ) ) ( not ( = ?auto_49585 ?auto_49582 ) ) ( not ( = ?auto_49588 ?auto_49586 ) ) ( HOIST-AT ?auto_49584 ?auto_49588 ) ( not ( = ?auto_49589 ?auto_49584 ) ) ( AVAILABLE ?auto_49584 ) ( SURFACE-AT ?auto_49582 ?auto_49588 ) ( ON ?auto_49582 ?auto_49583 ) ( CLEAR ?auto_49582 ) ( not ( = ?auto_49581 ?auto_49583 ) ) ( not ( = ?auto_49582 ?auto_49583 ) ) ( not ( = ?auto_49585 ?auto_49583 ) ) ( TRUCK-AT ?auto_49587 ?auto_49586 ) ( SURFACE-AT ?auto_49585 ?auto_49586 ) ( CLEAR ?auto_49585 ) ( IS-CRATE ?auto_49581 ) ( AVAILABLE ?auto_49589 ) ( IN ?auto_49581 ?auto_49587 ) )
    :subtasks
    ( ( !UNLOAD ?auto_49589 ?auto_49581 ?auto_49587 ?auto_49586 )
      ( MAKE-2CRATE ?auto_49585 ?auto_49581 ?auto_49582 )
      ( MAKE-1CRATE-VERIFY ?auto_49581 ?auto_49582 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_49590 - SURFACE
      ?auto_49591 - SURFACE
      ?auto_49592 - SURFACE
    )
    :vars
    (
      ?auto_49596 - HOIST
      ?auto_49597 - PLACE
      ?auto_49598 - PLACE
      ?auto_49595 - HOIST
      ?auto_49593 - SURFACE
      ?auto_49594 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_49596 ?auto_49597 ) ( IS-CRATE ?auto_49592 ) ( not ( = ?auto_49591 ?auto_49592 ) ) ( not ( = ?auto_49590 ?auto_49591 ) ) ( not ( = ?auto_49590 ?auto_49592 ) ) ( not ( = ?auto_49598 ?auto_49597 ) ) ( HOIST-AT ?auto_49595 ?auto_49598 ) ( not ( = ?auto_49596 ?auto_49595 ) ) ( AVAILABLE ?auto_49595 ) ( SURFACE-AT ?auto_49592 ?auto_49598 ) ( ON ?auto_49592 ?auto_49593 ) ( CLEAR ?auto_49592 ) ( not ( = ?auto_49591 ?auto_49593 ) ) ( not ( = ?auto_49592 ?auto_49593 ) ) ( not ( = ?auto_49590 ?auto_49593 ) ) ( TRUCK-AT ?auto_49594 ?auto_49597 ) ( SURFACE-AT ?auto_49590 ?auto_49597 ) ( CLEAR ?auto_49590 ) ( IS-CRATE ?auto_49591 ) ( AVAILABLE ?auto_49596 ) ( IN ?auto_49591 ?auto_49594 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_49591 ?auto_49592 )
      ( MAKE-2CRATE-VERIFY ?auto_49590 ?auto_49591 ?auto_49592 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_49635 - SURFACE
      ?auto_49636 - SURFACE
    )
    :vars
    (
      ?auto_49637 - HOIST
      ?auto_49643 - PLACE
      ?auto_49641 - SURFACE
      ?auto_49640 - PLACE
      ?auto_49642 - HOIST
      ?auto_49638 - SURFACE
      ?auto_49639 - TRUCK
      ?auto_49644 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_49637 ?auto_49643 ) ( SURFACE-AT ?auto_49635 ?auto_49643 ) ( CLEAR ?auto_49635 ) ( IS-CRATE ?auto_49636 ) ( not ( = ?auto_49635 ?auto_49636 ) ) ( AVAILABLE ?auto_49637 ) ( ON ?auto_49635 ?auto_49641 ) ( not ( = ?auto_49641 ?auto_49635 ) ) ( not ( = ?auto_49641 ?auto_49636 ) ) ( not ( = ?auto_49640 ?auto_49643 ) ) ( HOIST-AT ?auto_49642 ?auto_49640 ) ( not ( = ?auto_49637 ?auto_49642 ) ) ( AVAILABLE ?auto_49642 ) ( SURFACE-AT ?auto_49636 ?auto_49640 ) ( ON ?auto_49636 ?auto_49638 ) ( CLEAR ?auto_49636 ) ( not ( = ?auto_49635 ?auto_49638 ) ) ( not ( = ?auto_49636 ?auto_49638 ) ) ( not ( = ?auto_49641 ?auto_49638 ) ) ( TRUCK-AT ?auto_49639 ?auto_49644 ) ( not ( = ?auto_49644 ?auto_49643 ) ) ( not ( = ?auto_49640 ?auto_49644 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_49639 ?auto_49644 ?auto_49643 )
      ( MAKE-1CRATE ?auto_49635 ?auto_49636 )
      ( MAKE-1CRATE-VERIFY ?auto_49635 ?auto_49636 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_49674 - SURFACE
      ?auto_49675 - SURFACE
      ?auto_49676 - SURFACE
      ?auto_49677 - SURFACE
    )
    :vars
    (
      ?auto_49679 - HOIST
      ?auto_49678 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_49679 ?auto_49678 ) ( SURFACE-AT ?auto_49676 ?auto_49678 ) ( CLEAR ?auto_49676 ) ( LIFTING ?auto_49679 ?auto_49677 ) ( IS-CRATE ?auto_49677 ) ( not ( = ?auto_49676 ?auto_49677 ) ) ( ON ?auto_49675 ?auto_49674 ) ( ON ?auto_49676 ?auto_49675 ) ( not ( = ?auto_49674 ?auto_49675 ) ) ( not ( = ?auto_49674 ?auto_49676 ) ) ( not ( = ?auto_49674 ?auto_49677 ) ) ( not ( = ?auto_49675 ?auto_49676 ) ) ( not ( = ?auto_49675 ?auto_49677 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_49676 ?auto_49677 )
      ( MAKE-3CRATE-VERIFY ?auto_49674 ?auto_49675 ?auto_49676 ?auto_49677 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_49691 - SURFACE
      ?auto_49692 - SURFACE
      ?auto_49693 - SURFACE
      ?auto_49694 - SURFACE
    )
    :vars
    (
      ?auto_49696 - HOIST
      ?auto_49697 - PLACE
      ?auto_49695 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_49696 ?auto_49697 ) ( SURFACE-AT ?auto_49693 ?auto_49697 ) ( CLEAR ?auto_49693 ) ( IS-CRATE ?auto_49694 ) ( not ( = ?auto_49693 ?auto_49694 ) ) ( TRUCK-AT ?auto_49695 ?auto_49697 ) ( AVAILABLE ?auto_49696 ) ( IN ?auto_49694 ?auto_49695 ) ( ON ?auto_49693 ?auto_49692 ) ( not ( = ?auto_49692 ?auto_49693 ) ) ( not ( = ?auto_49692 ?auto_49694 ) ) ( ON ?auto_49692 ?auto_49691 ) ( not ( = ?auto_49691 ?auto_49692 ) ) ( not ( = ?auto_49691 ?auto_49693 ) ) ( not ( = ?auto_49691 ?auto_49694 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_49692 ?auto_49693 ?auto_49694 )
      ( MAKE-3CRATE-VERIFY ?auto_49691 ?auto_49692 ?auto_49693 ?auto_49694 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_49712 - SURFACE
      ?auto_49713 - SURFACE
      ?auto_49714 - SURFACE
      ?auto_49715 - SURFACE
    )
    :vars
    (
      ?auto_49718 - HOIST
      ?auto_49717 - PLACE
      ?auto_49719 - TRUCK
      ?auto_49716 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_49718 ?auto_49717 ) ( SURFACE-AT ?auto_49714 ?auto_49717 ) ( CLEAR ?auto_49714 ) ( IS-CRATE ?auto_49715 ) ( not ( = ?auto_49714 ?auto_49715 ) ) ( AVAILABLE ?auto_49718 ) ( IN ?auto_49715 ?auto_49719 ) ( ON ?auto_49714 ?auto_49713 ) ( not ( = ?auto_49713 ?auto_49714 ) ) ( not ( = ?auto_49713 ?auto_49715 ) ) ( TRUCK-AT ?auto_49719 ?auto_49716 ) ( not ( = ?auto_49716 ?auto_49717 ) ) ( ON ?auto_49713 ?auto_49712 ) ( not ( = ?auto_49712 ?auto_49713 ) ) ( not ( = ?auto_49712 ?auto_49714 ) ) ( not ( = ?auto_49712 ?auto_49715 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_49713 ?auto_49714 ?auto_49715 )
      ( MAKE-3CRATE-VERIFY ?auto_49712 ?auto_49713 ?auto_49714 ?auto_49715 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_49736 - SURFACE
      ?auto_49737 - SURFACE
      ?auto_49738 - SURFACE
      ?auto_49739 - SURFACE
    )
    :vars
    (
      ?auto_49744 - HOIST
      ?auto_49740 - PLACE
      ?auto_49741 - TRUCK
      ?auto_49742 - PLACE
      ?auto_49743 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_49744 ?auto_49740 ) ( SURFACE-AT ?auto_49738 ?auto_49740 ) ( CLEAR ?auto_49738 ) ( IS-CRATE ?auto_49739 ) ( not ( = ?auto_49738 ?auto_49739 ) ) ( AVAILABLE ?auto_49744 ) ( ON ?auto_49738 ?auto_49737 ) ( not ( = ?auto_49737 ?auto_49738 ) ) ( not ( = ?auto_49737 ?auto_49739 ) ) ( TRUCK-AT ?auto_49741 ?auto_49742 ) ( not ( = ?auto_49742 ?auto_49740 ) ) ( HOIST-AT ?auto_49743 ?auto_49742 ) ( LIFTING ?auto_49743 ?auto_49739 ) ( not ( = ?auto_49744 ?auto_49743 ) ) ( ON ?auto_49737 ?auto_49736 ) ( not ( = ?auto_49736 ?auto_49737 ) ) ( not ( = ?auto_49736 ?auto_49738 ) ) ( not ( = ?auto_49736 ?auto_49739 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_49737 ?auto_49738 ?auto_49739 )
      ( MAKE-3CRATE-VERIFY ?auto_49736 ?auto_49737 ?auto_49738 ?auto_49739 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_49763 - SURFACE
      ?auto_49764 - SURFACE
      ?auto_49765 - SURFACE
      ?auto_49766 - SURFACE
    )
    :vars
    (
      ?auto_49772 - HOIST
      ?auto_49768 - PLACE
      ?auto_49770 - TRUCK
      ?auto_49769 - PLACE
      ?auto_49767 - HOIST
      ?auto_49771 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_49772 ?auto_49768 ) ( SURFACE-AT ?auto_49765 ?auto_49768 ) ( CLEAR ?auto_49765 ) ( IS-CRATE ?auto_49766 ) ( not ( = ?auto_49765 ?auto_49766 ) ) ( AVAILABLE ?auto_49772 ) ( ON ?auto_49765 ?auto_49764 ) ( not ( = ?auto_49764 ?auto_49765 ) ) ( not ( = ?auto_49764 ?auto_49766 ) ) ( TRUCK-AT ?auto_49770 ?auto_49769 ) ( not ( = ?auto_49769 ?auto_49768 ) ) ( HOIST-AT ?auto_49767 ?auto_49769 ) ( not ( = ?auto_49772 ?auto_49767 ) ) ( AVAILABLE ?auto_49767 ) ( SURFACE-AT ?auto_49766 ?auto_49769 ) ( ON ?auto_49766 ?auto_49771 ) ( CLEAR ?auto_49766 ) ( not ( = ?auto_49765 ?auto_49771 ) ) ( not ( = ?auto_49766 ?auto_49771 ) ) ( not ( = ?auto_49764 ?auto_49771 ) ) ( ON ?auto_49764 ?auto_49763 ) ( not ( = ?auto_49763 ?auto_49764 ) ) ( not ( = ?auto_49763 ?auto_49765 ) ) ( not ( = ?auto_49763 ?auto_49766 ) ) ( not ( = ?auto_49763 ?auto_49771 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_49764 ?auto_49765 ?auto_49766 )
      ( MAKE-3CRATE-VERIFY ?auto_49763 ?auto_49764 ?auto_49765 ?auto_49766 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_49791 - SURFACE
      ?auto_49792 - SURFACE
      ?auto_49793 - SURFACE
      ?auto_49794 - SURFACE
    )
    :vars
    (
      ?auto_49797 - HOIST
      ?auto_49796 - PLACE
      ?auto_49800 - PLACE
      ?auto_49795 - HOIST
      ?auto_49798 - SURFACE
      ?auto_49799 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_49797 ?auto_49796 ) ( SURFACE-AT ?auto_49793 ?auto_49796 ) ( CLEAR ?auto_49793 ) ( IS-CRATE ?auto_49794 ) ( not ( = ?auto_49793 ?auto_49794 ) ) ( AVAILABLE ?auto_49797 ) ( ON ?auto_49793 ?auto_49792 ) ( not ( = ?auto_49792 ?auto_49793 ) ) ( not ( = ?auto_49792 ?auto_49794 ) ) ( not ( = ?auto_49800 ?auto_49796 ) ) ( HOIST-AT ?auto_49795 ?auto_49800 ) ( not ( = ?auto_49797 ?auto_49795 ) ) ( AVAILABLE ?auto_49795 ) ( SURFACE-AT ?auto_49794 ?auto_49800 ) ( ON ?auto_49794 ?auto_49798 ) ( CLEAR ?auto_49794 ) ( not ( = ?auto_49793 ?auto_49798 ) ) ( not ( = ?auto_49794 ?auto_49798 ) ) ( not ( = ?auto_49792 ?auto_49798 ) ) ( TRUCK-AT ?auto_49799 ?auto_49796 ) ( ON ?auto_49792 ?auto_49791 ) ( not ( = ?auto_49791 ?auto_49792 ) ) ( not ( = ?auto_49791 ?auto_49793 ) ) ( not ( = ?auto_49791 ?auto_49794 ) ) ( not ( = ?auto_49791 ?auto_49798 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_49792 ?auto_49793 ?auto_49794 )
      ( MAKE-3CRATE-VERIFY ?auto_49791 ?auto_49792 ?auto_49793 ?auto_49794 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_49819 - SURFACE
      ?auto_49820 - SURFACE
      ?auto_49821 - SURFACE
      ?auto_49822 - SURFACE
    )
    :vars
    (
      ?auto_49825 - HOIST
      ?auto_49826 - PLACE
      ?auto_49828 - PLACE
      ?auto_49824 - HOIST
      ?auto_49827 - SURFACE
      ?auto_49823 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_49825 ?auto_49826 ) ( IS-CRATE ?auto_49822 ) ( not ( = ?auto_49821 ?auto_49822 ) ) ( not ( = ?auto_49820 ?auto_49821 ) ) ( not ( = ?auto_49820 ?auto_49822 ) ) ( not ( = ?auto_49828 ?auto_49826 ) ) ( HOIST-AT ?auto_49824 ?auto_49828 ) ( not ( = ?auto_49825 ?auto_49824 ) ) ( AVAILABLE ?auto_49824 ) ( SURFACE-AT ?auto_49822 ?auto_49828 ) ( ON ?auto_49822 ?auto_49827 ) ( CLEAR ?auto_49822 ) ( not ( = ?auto_49821 ?auto_49827 ) ) ( not ( = ?auto_49822 ?auto_49827 ) ) ( not ( = ?auto_49820 ?auto_49827 ) ) ( TRUCK-AT ?auto_49823 ?auto_49826 ) ( SURFACE-AT ?auto_49820 ?auto_49826 ) ( CLEAR ?auto_49820 ) ( LIFTING ?auto_49825 ?auto_49821 ) ( IS-CRATE ?auto_49821 ) ( ON ?auto_49820 ?auto_49819 ) ( not ( = ?auto_49819 ?auto_49820 ) ) ( not ( = ?auto_49819 ?auto_49821 ) ) ( not ( = ?auto_49819 ?auto_49822 ) ) ( not ( = ?auto_49819 ?auto_49827 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_49820 ?auto_49821 ?auto_49822 )
      ( MAKE-3CRATE-VERIFY ?auto_49819 ?auto_49820 ?auto_49821 ?auto_49822 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_49847 - SURFACE
      ?auto_49848 - SURFACE
      ?auto_49849 - SURFACE
      ?auto_49850 - SURFACE
    )
    :vars
    (
      ?auto_49852 - HOIST
      ?auto_49853 - PLACE
      ?auto_49854 - PLACE
      ?auto_49851 - HOIST
      ?auto_49855 - SURFACE
      ?auto_49856 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_49852 ?auto_49853 ) ( IS-CRATE ?auto_49850 ) ( not ( = ?auto_49849 ?auto_49850 ) ) ( not ( = ?auto_49848 ?auto_49849 ) ) ( not ( = ?auto_49848 ?auto_49850 ) ) ( not ( = ?auto_49854 ?auto_49853 ) ) ( HOIST-AT ?auto_49851 ?auto_49854 ) ( not ( = ?auto_49852 ?auto_49851 ) ) ( AVAILABLE ?auto_49851 ) ( SURFACE-AT ?auto_49850 ?auto_49854 ) ( ON ?auto_49850 ?auto_49855 ) ( CLEAR ?auto_49850 ) ( not ( = ?auto_49849 ?auto_49855 ) ) ( not ( = ?auto_49850 ?auto_49855 ) ) ( not ( = ?auto_49848 ?auto_49855 ) ) ( TRUCK-AT ?auto_49856 ?auto_49853 ) ( SURFACE-AT ?auto_49848 ?auto_49853 ) ( CLEAR ?auto_49848 ) ( IS-CRATE ?auto_49849 ) ( AVAILABLE ?auto_49852 ) ( IN ?auto_49849 ?auto_49856 ) ( ON ?auto_49848 ?auto_49847 ) ( not ( = ?auto_49847 ?auto_49848 ) ) ( not ( = ?auto_49847 ?auto_49849 ) ) ( not ( = ?auto_49847 ?auto_49850 ) ) ( not ( = ?auto_49847 ?auto_49855 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_49848 ?auto_49849 ?auto_49850 )
      ( MAKE-3CRATE-VERIFY ?auto_49847 ?auto_49848 ?auto_49849 ?auto_49850 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_50138 - SURFACE
      ?auto_50139 - SURFACE
      ?auto_50140 - SURFACE
      ?auto_50142 - SURFACE
      ?auto_50141 - SURFACE
    )
    :vars
    (
      ?auto_50144 - HOIST
      ?auto_50143 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_50144 ?auto_50143 ) ( SURFACE-AT ?auto_50142 ?auto_50143 ) ( CLEAR ?auto_50142 ) ( LIFTING ?auto_50144 ?auto_50141 ) ( IS-CRATE ?auto_50141 ) ( not ( = ?auto_50142 ?auto_50141 ) ) ( ON ?auto_50139 ?auto_50138 ) ( ON ?auto_50140 ?auto_50139 ) ( ON ?auto_50142 ?auto_50140 ) ( not ( = ?auto_50138 ?auto_50139 ) ) ( not ( = ?auto_50138 ?auto_50140 ) ) ( not ( = ?auto_50138 ?auto_50142 ) ) ( not ( = ?auto_50138 ?auto_50141 ) ) ( not ( = ?auto_50139 ?auto_50140 ) ) ( not ( = ?auto_50139 ?auto_50142 ) ) ( not ( = ?auto_50139 ?auto_50141 ) ) ( not ( = ?auto_50140 ?auto_50142 ) ) ( not ( = ?auto_50140 ?auto_50141 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_50142 ?auto_50141 )
      ( MAKE-4CRATE-VERIFY ?auto_50138 ?auto_50139 ?auto_50140 ?auto_50142 ?auto_50141 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_50163 - SURFACE
      ?auto_50164 - SURFACE
      ?auto_50165 - SURFACE
      ?auto_50167 - SURFACE
      ?auto_50166 - SURFACE
    )
    :vars
    (
      ?auto_50170 - HOIST
      ?auto_50169 - PLACE
      ?auto_50168 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_50170 ?auto_50169 ) ( SURFACE-AT ?auto_50167 ?auto_50169 ) ( CLEAR ?auto_50167 ) ( IS-CRATE ?auto_50166 ) ( not ( = ?auto_50167 ?auto_50166 ) ) ( TRUCK-AT ?auto_50168 ?auto_50169 ) ( AVAILABLE ?auto_50170 ) ( IN ?auto_50166 ?auto_50168 ) ( ON ?auto_50167 ?auto_50165 ) ( not ( = ?auto_50165 ?auto_50167 ) ) ( not ( = ?auto_50165 ?auto_50166 ) ) ( ON ?auto_50164 ?auto_50163 ) ( ON ?auto_50165 ?auto_50164 ) ( not ( = ?auto_50163 ?auto_50164 ) ) ( not ( = ?auto_50163 ?auto_50165 ) ) ( not ( = ?auto_50163 ?auto_50167 ) ) ( not ( = ?auto_50163 ?auto_50166 ) ) ( not ( = ?auto_50164 ?auto_50165 ) ) ( not ( = ?auto_50164 ?auto_50167 ) ) ( not ( = ?auto_50164 ?auto_50166 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_50165 ?auto_50167 ?auto_50166 )
      ( MAKE-4CRATE-VERIFY ?auto_50163 ?auto_50164 ?auto_50165 ?auto_50167 ?auto_50166 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_50193 - SURFACE
      ?auto_50194 - SURFACE
      ?auto_50195 - SURFACE
      ?auto_50197 - SURFACE
      ?auto_50196 - SURFACE
    )
    :vars
    (
      ?auto_50201 - HOIST
      ?auto_50198 - PLACE
      ?auto_50199 - TRUCK
      ?auto_50200 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_50201 ?auto_50198 ) ( SURFACE-AT ?auto_50197 ?auto_50198 ) ( CLEAR ?auto_50197 ) ( IS-CRATE ?auto_50196 ) ( not ( = ?auto_50197 ?auto_50196 ) ) ( AVAILABLE ?auto_50201 ) ( IN ?auto_50196 ?auto_50199 ) ( ON ?auto_50197 ?auto_50195 ) ( not ( = ?auto_50195 ?auto_50197 ) ) ( not ( = ?auto_50195 ?auto_50196 ) ) ( TRUCK-AT ?auto_50199 ?auto_50200 ) ( not ( = ?auto_50200 ?auto_50198 ) ) ( ON ?auto_50194 ?auto_50193 ) ( ON ?auto_50195 ?auto_50194 ) ( not ( = ?auto_50193 ?auto_50194 ) ) ( not ( = ?auto_50193 ?auto_50195 ) ) ( not ( = ?auto_50193 ?auto_50197 ) ) ( not ( = ?auto_50193 ?auto_50196 ) ) ( not ( = ?auto_50194 ?auto_50195 ) ) ( not ( = ?auto_50194 ?auto_50197 ) ) ( not ( = ?auto_50194 ?auto_50196 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_50195 ?auto_50197 ?auto_50196 )
      ( MAKE-4CRATE-VERIFY ?auto_50193 ?auto_50194 ?auto_50195 ?auto_50197 ?auto_50196 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_50227 - SURFACE
      ?auto_50228 - SURFACE
      ?auto_50229 - SURFACE
      ?auto_50231 - SURFACE
      ?auto_50230 - SURFACE
    )
    :vars
    (
      ?auto_50234 - HOIST
      ?auto_50236 - PLACE
      ?auto_50235 - TRUCK
      ?auto_50233 - PLACE
      ?auto_50232 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_50234 ?auto_50236 ) ( SURFACE-AT ?auto_50231 ?auto_50236 ) ( CLEAR ?auto_50231 ) ( IS-CRATE ?auto_50230 ) ( not ( = ?auto_50231 ?auto_50230 ) ) ( AVAILABLE ?auto_50234 ) ( ON ?auto_50231 ?auto_50229 ) ( not ( = ?auto_50229 ?auto_50231 ) ) ( not ( = ?auto_50229 ?auto_50230 ) ) ( TRUCK-AT ?auto_50235 ?auto_50233 ) ( not ( = ?auto_50233 ?auto_50236 ) ) ( HOIST-AT ?auto_50232 ?auto_50233 ) ( LIFTING ?auto_50232 ?auto_50230 ) ( not ( = ?auto_50234 ?auto_50232 ) ) ( ON ?auto_50228 ?auto_50227 ) ( ON ?auto_50229 ?auto_50228 ) ( not ( = ?auto_50227 ?auto_50228 ) ) ( not ( = ?auto_50227 ?auto_50229 ) ) ( not ( = ?auto_50227 ?auto_50231 ) ) ( not ( = ?auto_50227 ?auto_50230 ) ) ( not ( = ?auto_50228 ?auto_50229 ) ) ( not ( = ?auto_50228 ?auto_50231 ) ) ( not ( = ?auto_50228 ?auto_50230 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_50229 ?auto_50231 ?auto_50230 )
      ( MAKE-4CRATE-VERIFY ?auto_50227 ?auto_50228 ?auto_50229 ?auto_50231 ?auto_50230 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_50265 - SURFACE
      ?auto_50266 - SURFACE
      ?auto_50267 - SURFACE
      ?auto_50269 - SURFACE
      ?auto_50268 - SURFACE
    )
    :vars
    (
      ?auto_50271 - HOIST
      ?auto_50272 - PLACE
      ?auto_50273 - TRUCK
      ?auto_50274 - PLACE
      ?auto_50275 - HOIST
      ?auto_50270 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_50271 ?auto_50272 ) ( SURFACE-AT ?auto_50269 ?auto_50272 ) ( CLEAR ?auto_50269 ) ( IS-CRATE ?auto_50268 ) ( not ( = ?auto_50269 ?auto_50268 ) ) ( AVAILABLE ?auto_50271 ) ( ON ?auto_50269 ?auto_50267 ) ( not ( = ?auto_50267 ?auto_50269 ) ) ( not ( = ?auto_50267 ?auto_50268 ) ) ( TRUCK-AT ?auto_50273 ?auto_50274 ) ( not ( = ?auto_50274 ?auto_50272 ) ) ( HOIST-AT ?auto_50275 ?auto_50274 ) ( not ( = ?auto_50271 ?auto_50275 ) ) ( AVAILABLE ?auto_50275 ) ( SURFACE-AT ?auto_50268 ?auto_50274 ) ( ON ?auto_50268 ?auto_50270 ) ( CLEAR ?auto_50268 ) ( not ( = ?auto_50269 ?auto_50270 ) ) ( not ( = ?auto_50268 ?auto_50270 ) ) ( not ( = ?auto_50267 ?auto_50270 ) ) ( ON ?auto_50266 ?auto_50265 ) ( ON ?auto_50267 ?auto_50266 ) ( not ( = ?auto_50265 ?auto_50266 ) ) ( not ( = ?auto_50265 ?auto_50267 ) ) ( not ( = ?auto_50265 ?auto_50269 ) ) ( not ( = ?auto_50265 ?auto_50268 ) ) ( not ( = ?auto_50265 ?auto_50270 ) ) ( not ( = ?auto_50266 ?auto_50267 ) ) ( not ( = ?auto_50266 ?auto_50269 ) ) ( not ( = ?auto_50266 ?auto_50268 ) ) ( not ( = ?auto_50266 ?auto_50270 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_50267 ?auto_50269 ?auto_50268 )
      ( MAKE-4CRATE-VERIFY ?auto_50265 ?auto_50266 ?auto_50267 ?auto_50269 ?auto_50268 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_50304 - SURFACE
      ?auto_50305 - SURFACE
      ?auto_50306 - SURFACE
      ?auto_50308 - SURFACE
      ?auto_50307 - SURFACE
    )
    :vars
    (
      ?auto_50313 - HOIST
      ?auto_50312 - PLACE
      ?auto_50314 - PLACE
      ?auto_50309 - HOIST
      ?auto_50310 - SURFACE
      ?auto_50311 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_50313 ?auto_50312 ) ( SURFACE-AT ?auto_50308 ?auto_50312 ) ( CLEAR ?auto_50308 ) ( IS-CRATE ?auto_50307 ) ( not ( = ?auto_50308 ?auto_50307 ) ) ( AVAILABLE ?auto_50313 ) ( ON ?auto_50308 ?auto_50306 ) ( not ( = ?auto_50306 ?auto_50308 ) ) ( not ( = ?auto_50306 ?auto_50307 ) ) ( not ( = ?auto_50314 ?auto_50312 ) ) ( HOIST-AT ?auto_50309 ?auto_50314 ) ( not ( = ?auto_50313 ?auto_50309 ) ) ( AVAILABLE ?auto_50309 ) ( SURFACE-AT ?auto_50307 ?auto_50314 ) ( ON ?auto_50307 ?auto_50310 ) ( CLEAR ?auto_50307 ) ( not ( = ?auto_50308 ?auto_50310 ) ) ( not ( = ?auto_50307 ?auto_50310 ) ) ( not ( = ?auto_50306 ?auto_50310 ) ) ( TRUCK-AT ?auto_50311 ?auto_50312 ) ( ON ?auto_50305 ?auto_50304 ) ( ON ?auto_50306 ?auto_50305 ) ( not ( = ?auto_50304 ?auto_50305 ) ) ( not ( = ?auto_50304 ?auto_50306 ) ) ( not ( = ?auto_50304 ?auto_50308 ) ) ( not ( = ?auto_50304 ?auto_50307 ) ) ( not ( = ?auto_50304 ?auto_50310 ) ) ( not ( = ?auto_50305 ?auto_50306 ) ) ( not ( = ?auto_50305 ?auto_50308 ) ) ( not ( = ?auto_50305 ?auto_50307 ) ) ( not ( = ?auto_50305 ?auto_50310 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_50306 ?auto_50308 ?auto_50307 )
      ( MAKE-4CRATE-VERIFY ?auto_50304 ?auto_50305 ?auto_50306 ?auto_50308 ?auto_50307 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_50343 - SURFACE
      ?auto_50344 - SURFACE
      ?auto_50345 - SURFACE
      ?auto_50347 - SURFACE
      ?auto_50346 - SURFACE
    )
    :vars
    (
      ?auto_50351 - HOIST
      ?auto_50353 - PLACE
      ?auto_50352 - PLACE
      ?auto_50348 - HOIST
      ?auto_50349 - SURFACE
      ?auto_50350 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_50351 ?auto_50353 ) ( IS-CRATE ?auto_50346 ) ( not ( = ?auto_50347 ?auto_50346 ) ) ( not ( = ?auto_50345 ?auto_50347 ) ) ( not ( = ?auto_50345 ?auto_50346 ) ) ( not ( = ?auto_50352 ?auto_50353 ) ) ( HOIST-AT ?auto_50348 ?auto_50352 ) ( not ( = ?auto_50351 ?auto_50348 ) ) ( AVAILABLE ?auto_50348 ) ( SURFACE-AT ?auto_50346 ?auto_50352 ) ( ON ?auto_50346 ?auto_50349 ) ( CLEAR ?auto_50346 ) ( not ( = ?auto_50347 ?auto_50349 ) ) ( not ( = ?auto_50346 ?auto_50349 ) ) ( not ( = ?auto_50345 ?auto_50349 ) ) ( TRUCK-AT ?auto_50350 ?auto_50353 ) ( SURFACE-AT ?auto_50345 ?auto_50353 ) ( CLEAR ?auto_50345 ) ( LIFTING ?auto_50351 ?auto_50347 ) ( IS-CRATE ?auto_50347 ) ( ON ?auto_50344 ?auto_50343 ) ( ON ?auto_50345 ?auto_50344 ) ( not ( = ?auto_50343 ?auto_50344 ) ) ( not ( = ?auto_50343 ?auto_50345 ) ) ( not ( = ?auto_50343 ?auto_50347 ) ) ( not ( = ?auto_50343 ?auto_50346 ) ) ( not ( = ?auto_50343 ?auto_50349 ) ) ( not ( = ?auto_50344 ?auto_50345 ) ) ( not ( = ?auto_50344 ?auto_50347 ) ) ( not ( = ?auto_50344 ?auto_50346 ) ) ( not ( = ?auto_50344 ?auto_50349 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_50345 ?auto_50347 ?auto_50346 )
      ( MAKE-4CRATE-VERIFY ?auto_50343 ?auto_50344 ?auto_50345 ?auto_50347 ?auto_50346 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_50382 - SURFACE
      ?auto_50383 - SURFACE
      ?auto_50384 - SURFACE
      ?auto_50386 - SURFACE
      ?auto_50385 - SURFACE
    )
    :vars
    (
      ?auto_50390 - HOIST
      ?auto_50387 - PLACE
      ?auto_50392 - PLACE
      ?auto_50388 - HOIST
      ?auto_50389 - SURFACE
      ?auto_50391 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_50390 ?auto_50387 ) ( IS-CRATE ?auto_50385 ) ( not ( = ?auto_50386 ?auto_50385 ) ) ( not ( = ?auto_50384 ?auto_50386 ) ) ( not ( = ?auto_50384 ?auto_50385 ) ) ( not ( = ?auto_50392 ?auto_50387 ) ) ( HOIST-AT ?auto_50388 ?auto_50392 ) ( not ( = ?auto_50390 ?auto_50388 ) ) ( AVAILABLE ?auto_50388 ) ( SURFACE-AT ?auto_50385 ?auto_50392 ) ( ON ?auto_50385 ?auto_50389 ) ( CLEAR ?auto_50385 ) ( not ( = ?auto_50386 ?auto_50389 ) ) ( not ( = ?auto_50385 ?auto_50389 ) ) ( not ( = ?auto_50384 ?auto_50389 ) ) ( TRUCK-AT ?auto_50391 ?auto_50387 ) ( SURFACE-AT ?auto_50384 ?auto_50387 ) ( CLEAR ?auto_50384 ) ( IS-CRATE ?auto_50386 ) ( AVAILABLE ?auto_50390 ) ( IN ?auto_50386 ?auto_50391 ) ( ON ?auto_50383 ?auto_50382 ) ( ON ?auto_50384 ?auto_50383 ) ( not ( = ?auto_50382 ?auto_50383 ) ) ( not ( = ?auto_50382 ?auto_50384 ) ) ( not ( = ?auto_50382 ?auto_50386 ) ) ( not ( = ?auto_50382 ?auto_50385 ) ) ( not ( = ?auto_50382 ?auto_50389 ) ) ( not ( = ?auto_50383 ?auto_50384 ) ) ( not ( = ?auto_50383 ?auto_50386 ) ) ( not ( = ?auto_50383 ?auto_50385 ) ) ( not ( = ?auto_50383 ?auto_50389 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_50384 ?auto_50386 ?auto_50385 )
      ( MAKE-4CRATE-VERIFY ?auto_50382 ?auto_50383 ?auto_50384 ?auto_50386 ?auto_50385 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_51042 - SURFACE
      ?auto_51043 - SURFACE
      ?auto_51044 - SURFACE
      ?auto_51046 - SURFACE
      ?auto_51045 - SURFACE
      ?auto_51047 - SURFACE
    )
    :vars
    (
      ?auto_51048 - HOIST
      ?auto_51049 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_51048 ?auto_51049 ) ( SURFACE-AT ?auto_51045 ?auto_51049 ) ( CLEAR ?auto_51045 ) ( LIFTING ?auto_51048 ?auto_51047 ) ( IS-CRATE ?auto_51047 ) ( not ( = ?auto_51045 ?auto_51047 ) ) ( ON ?auto_51043 ?auto_51042 ) ( ON ?auto_51044 ?auto_51043 ) ( ON ?auto_51046 ?auto_51044 ) ( ON ?auto_51045 ?auto_51046 ) ( not ( = ?auto_51042 ?auto_51043 ) ) ( not ( = ?auto_51042 ?auto_51044 ) ) ( not ( = ?auto_51042 ?auto_51046 ) ) ( not ( = ?auto_51042 ?auto_51045 ) ) ( not ( = ?auto_51042 ?auto_51047 ) ) ( not ( = ?auto_51043 ?auto_51044 ) ) ( not ( = ?auto_51043 ?auto_51046 ) ) ( not ( = ?auto_51043 ?auto_51045 ) ) ( not ( = ?auto_51043 ?auto_51047 ) ) ( not ( = ?auto_51044 ?auto_51046 ) ) ( not ( = ?auto_51044 ?auto_51045 ) ) ( not ( = ?auto_51044 ?auto_51047 ) ) ( not ( = ?auto_51046 ?auto_51045 ) ) ( not ( = ?auto_51046 ?auto_51047 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_51045 ?auto_51047 )
      ( MAKE-5CRATE-VERIFY ?auto_51042 ?auto_51043 ?auto_51044 ?auto_51046 ?auto_51045 ?auto_51047 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_51076 - SURFACE
      ?auto_51077 - SURFACE
      ?auto_51078 - SURFACE
      ?auto_51080 - SURFACE
      ?auto_51079 - SURFACE
      ?auto_51081 - SURFACE
    )
    :vars
    (
      ?auto_51084 - HOIST
      ?auto_51083 - PLACE
      ?auto_51082 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_51084 ?auto_51083 ) ( SURFACE-AT ?auto_51079 ?auto_51083 ) ( CLEAR ?auto_51079 ) ( IS-CRATE ?auto_51081 ) ( not ( = ?auto_51079 ?auto_51081 ) ) ( TRUCK-AT ?auto_51082 ?auto_51083 ) ( AVAILABLE ?auto_51084 ) ( IN ?auto_51081 ?auto_51082 ) ( ON ?auto_51079 ?auto_51080 ) ( not ( = ?auto_51080 ?auto_51079 ) ) ( not ( = ?auto_51080 ?auto_51081 ) ) ( ON ?auto_51077 ?auto_51076 ) ( ON ?auto_51078 ?auto_51077 ) ( ON ?auto_51080 ?auto_51078 ) ( not ( = ?auto_51076 ?auto_51077 ) ) ( not ( = ?auto_51076 ?auto_51078 ) ) ( not ( = ?auto_51076 ?auto_51080 ) ) ( not ( = ?auto_51076 ?auto_51079 ) ) ( not ( = ?auto_51076 ?auto_51081 ) ) ( not ( = ?auto_51077 ?auto_51078 ) ) ( not ( = ?auto_51077 ?auto_51080 ) ) ( not ( = ?auto_51077 ?auto_51079 ) ) ( not ( = ?auto_51077 ?auto_51081 ) ) ( not ( = ?auto_51078 ?auto_51080 ) ) ( not ( = ?auto_51078 ?auto_51079 ) ) ( not ( = ?auto_51078 ?auto_51081 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_51080 ?auto_51079 ?auto_51081 )
      ( MAKE-5CRATE-VERIFY ?auto_51076 ?auto_51077 ?auto_51078 ?auto_51080 ?auto_51079 ?auto_51081 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_51116 - SURFACE
      ?auto_51117 - SURFACE
      ?auto_51118 - SURFACE
      ?auto_51120 - SURFACE
      ?auto_51119 - SURFACE
      ?auto_51121 - SURFACE
    )
    :vars
    (
      ?auto_51123 - HOIST
      ?auto_51122 - PLACE
      ?auto_51124 - TRUCK
      ?auto_51125 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_51123 ?auto_51122 ) ( SURFACE-AT ?auto_51119 ?auto_51122 ) ( CLEAR ?auto_51119 ) ( IS-CRATE ?auto_51121 ) ( not ( = ?auto_51119 ?auto_51121 ) ) ( AVAILABLE ?auto_51123 ) ( IN ?auto_51121 ?auto_51124 ) ( ON ?auto_51119 ?auto_51120 ) ( not ( = ?auto_51120 ?auto_51119 ) ) ( not ( = ?auto_51120 ?auto_51121 ) ) ( TRUCK-AT ?auto_51124 ?auto_51125 ) ( not ( = ?auto_51125 ?auto_51122 ) ) ( ON ?auto_51117 ?auto_51116 ) ( ON ?auto_51118 ?auto_51117 ) ( ON ?auto_51120 ?auto_51118 ) ( not ( = ?auto_51116 ?auto_51117 ) ) ( not ( = ?auto_51116 ?auto_51118 ) ) ( not ( = ?auto_51116 ?auto_51120 ) ) ( not ( = ?auto_51116 ?auto_51119 ) ) ( not ( = ?auto_51116 ?auto_51121 ) ) ( not ( = ?auto_51117 ?auto_51118 ) ) ( not ( = ?auto_51117 ?auto_51120 ) ) ( not ( = ?auto_51117 ?auto_51119 ) ) ( not ( = ?auto_51117 ?auto_51121 ) ) ( not ( = ?auto_51118 ?auto_51120 ) ) ( not ( = ?auto_51118 ?auto_51119 ) ) ( not ( = ?auto_51118 ?auto_51121 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_51120 ?auto_51119 ?auto_51121 )
      ( MAKE-5CRATE-VERIFY ?auto_51116 ?auto_51117 ?auto_51118 ?auto_51120 ?auto_51119 ?auto_51121 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_51161 - SURFACE
      ?auto_51162 - SURFACE
      ?auto_51163 - SURFACE
      ?auto_51165 - SURFACE
      ?auto_51164 - SURFACE
      ?auto_51166 - SURFACE
    )
    :vars
    (
      ?auto_51171 - HOIST
      ?auto_51167 - PLACE
      ?auto_51168 - TRUCK
      ?auto_51170 - PLACE
      ?auto_51169 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_51171 ?auto_51167 ) ( SURFACE-AT ?auto_51164 ?auto_51167 ) ( CLEAR ?auto_51164 ) ( IS-CRATE ?auto_51166 ) ( not ( = ?auto_51164 ?auto_51166 ) ) ( AVAILABLE ?auto_51171 ) ( ON ?auto_51164 ?auto_51165 ) ( not ( = ?auto_51165 ?auto_51164 ) ) ( not ( = ?auto_51165 ?auto_51166 ) ) ( TRUCK-AT ?auto_51168 ?auto_51170 ) ( not ( = ?auto_51170 ?auto_51167 ) ) ( HOIST-AT ?auto_51169 ?auto_51170 ) ( LIFTING ?auto_51169 ?auto_51166 ) ( not ( = ?auto_51171 ?auto_51169 ) ) ( ON ?auto_51162 ?auto_51161 ) ( ON ?auto_51163 ?auto_51162 ) ( ON ?auto_51165 ?auto_51163 ) ( not ( = ?auto_51161 ?auto_51162 ) ) ( not ( = ?auto_51161 ?auto_51163 ) ) ( not ( = ?auto_51161 ?auto_51165 ) ) ( not ( = ?auto_51161 ?auto_51164 ) ) ( not ( = ?auto_51161 ?auto_51166 ) ) ( not ( = ?auto_51162 ?auto_51163 ) ) ( not ( = ?auto_51162 ?auto_51165 ) ) ( not ( = ?auto_51162 ?auto_51164 ) ) ( not ( = ?auto_51162 ?auto_51166 ) ) ( not ( = ?auto_51163 ?auto_51165 ) ) ( not ( = ?auto_51163 ?auto_51164 ) ) ( not ( = ?auto_51163 ?auto_51166 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_51165 ?auto_51164 ?auto_51166 )
      ( MAKE-5CRATE-VERIFY ?auto_51161 ?auto_51162 ?auto_51163 ?auto_51165 ?auto_51164 ?auto_51166 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_51211 - SURFACE
      ?auto_51212 - SURFACE
      ?auto_51213 - SURFACE
      ?auto_51215 - SURFACE
      ?auto_51214 - SURFACE
      ?auto_51216 - SURFACE
    )
    :vars
    (
      ?auto_51217 - HOIST
      ?auto_51222 - PLACE
      ?auto_51219 - TRUCK
      ?auto_51220 - PLACE
      ?auto_51221 - HOIST
      ?auto_51218 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_51217 ?auto_51222 ) ( SURFACE-AT ?auto_51214 ?auto_51222 ) ( CLEAR ?auto_51214 ) ( IS-CRATE ?auto_51216 ) ( not ( = ?auto_51214 ?auto_51216 ) ) ( AVAILABLE ?auto_51217 ) ( ON ?auto_51214 ?auto_51215 ) ( not ( = ?auto_51215 ?auto_51214 ) ) ( not ( = ?auto_51215 ?auto_51216 ) ) ( TRUCK-AT ?auto_51219 ?auto_51220 ) ( not ( = ?auto_51220 ?auto_51222 ) ) ( HOIST-AT ?auto_51221 ?auto_51220 ) ( not ( = ?auto_51217 ?auto_51221 ) ) ( AVAILABLE ?auto_51221 ) ( SURFACE-AT ?auto_51216 ?auto_51220 ) ( ON ?auto_51216 ?auto_51218 ) ( CLEAR ?auto_51216 ) ( not ( = ?auto_51214 ?auto_51218 ) ) ( not ( = ?auto_51216 ?auto_51218 ) ) ( not ( = ?auto_51215 ?auto_51218 ) ) ( ON ?auto_51212 ?auto_51211 ) ( ON ?auto_51213 ?auto_51212 ) ( ON ?auto_51215 ?auto_51213 ) ( not ( = ?auto_51211 ?auto_51212 ) ) ( not ( = ?auto_51211 ?auto_51213 ) ) ( not ( = ?auto_51211 ?auto_51215 ) ) ( not ( = ?auto_51211 ?auto_51214 ) ) ( not ( = ?auto_51211 ?auto_51216 ) ) ( not ( = ?auto_51211 ?auto_51218 ) ) ( not ( = ?auto_51212 ?auto_51213 ) ) ( not ( = ?auto_51212 ?auto_51215 ) ) ( not ( = ?auto_51212 ?auto_51214 ) ) ( not ( = ?auto_51212 ?auto_51216 ) ) ( not ( = ?auto_51212 ?auto_51218 ) ) ( not ( = ?auto_51213 ?auto_51215 ) ) ( not ( = ?auto_51213 ?auto_51214 ) ) ( not ( = ?auto_51213 ?auto_51216 ) ) ( not ( = ?auto_51213 ?auto_51218 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_51215 ?auto_51214 ?auto_51216 )
      ( MAKE-5CRATE-VERIFY ?auto_51211 ?auto_51212 ?auto_51213 ?auto_51215 ?auto_51214 ?auto_51216 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_51262 - SURFACE
      ?auto_51263 - SURFACE
      ?auto_51264 - SURFACE
      ?auto_51266 - SURFACE
      ?auto_51265 - SURFACE
      ?auto_51267 - SURFACE
    )
    :vars
    (
      ?auto_51268 - HOIST
      ?auto_51269 - PLACE
      ?auto_51273 - PLACE
      ?auto_51272 - HOIST
      ?auto_51270 - SURFACE
      ?auto_51271 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_51268 ?auto_51269 ) ( SURFACE-AT ?auto_51265 ?auto_51269 ) ( CLEAR ?auto_51265 ) ( IS-CRATE ?auto_51267 ) ( not ( = ?auto_51265 ?auto_51267 ) ) ( AVAILABLE ?auto_51268 ) ( ON ?auto_51265 ?auto_51266 ) ( not ( = ?auto_51266 ?auto_51265 ) ) ( not ( = ?auto_51266 ?auto_51267 ) ) ( not ( = ?auto_51273 ?auto_51269 ) ) ( HOIST-AT ?auto_51272 ?auto_51273 ) ( not ( = ?auto_51268 ?auto_51272 ) ) ( AVAILABLE ?auto_51272 ) ( SURFACE-AT ?auto_51267 ?auto_51273 ) ( ON ?auto_51267 ?auto_51270 ) ( CLEAR ?auto_51267 ) ( not ( = ?auto_51265 ?auto_51270 ) ) ( not ( = ?auto_51267 ?auto_51270 ) ) ( not ( = ?auto_51266 ?auto_51270 ) ) ( TRUCK-AT ?auto_51271 ?auto_51269 ) ( ON ?auto_51263 ?auto_51262 ) ( ON ?auto_51264 ?auto_51263 ) ( ON ?auto_51266 ?auto_51264 ) ( not ( = ?auto_51262 ?auto_51263 ) ) ( not ( = ?auto_51262 ?auto_51264 ) ) ( not ( = ?auto_51262 ?auto_51266 ) ) ( not ( = ?auto_51262 ?auto_51265 ) ) ( not ( = ?auto_51262 ?auto_51267 ) ) ( not ( = ?auto_51262 ?auto_51270 ) ) ( not ( = ?auto_51263 ?auto_51264 ) ) ( not ( = ?auto_51263 ?auto_51266 ) ) ( not ( = ?auto_51263 ?auto_51265 ) ) ( not ( = ?auto_51263 ?auto_51267 ) ) ( not ( = ?auto_51263 ?auto_51270 ) ) ( not ( = ?auto_51264 ?auto_51266 ) ) ( not ( = ?auto_51264 ?auto_51265 ) ) ( not ( = ?auto_51264 ?auto_51267 ) ) ( not ( = ?auto_51264 ?auto_51270 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_51266 ?auto_51265 ?auto_51267 )
      ( MAKE-5CRATE-VERIFY ?auto_51262 ?auto_51263 ?auto_51264 ?auto_51266 ?auto_51265 ?auto_51267 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_51313 - SURFACE
      ?auto_51314 - SURFACE
      ?auto_51315 - SURFACE
      ?auto_51317 - SURFACE
      ?auto_51316 - SURFACE
      ?auto_51318 - SURFACE
    )
    :vars
    (
      ?auto_51324 - HOIST
      ?auto_51322 - PLACE
      ?auto_51320 - PLACE
      ?auto_51323 - HOIST
      ?auto_51319 - SURFACE
      ?auto_51321 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_51324 ?auto_51322 ) ( IS-CRATE ?auto_51318 ) ( not ( = ?auto_51316 ?auto_51318 ) ) ( not ( = ?auto_51317 ?auto_51316 ) ) ( not ( = ?auto_51317 ?auto_51318 ) ) ( not ( = ?auto_51320 ?auto_51322 ) ) ( HOIST-AT ?auto_51323 ?auto_51320 ) ( not ( = ?auto_51324 ?auto_51323 ) ) ( AVAILABLE ?auto_51323 ) ( SURFACE-AT ?auto_51318 ?auto_51320 ) ( ON ?auto_51318 ?auto_51319 ) ( CLEAR ?auto_51318 ) ( not ( = ?auto_51316 ?auto_51319 ) ) ( not ( = ?auto_51318 ?auto_51319 ) ) ( not ( = ?auto_51317 ?auto_51319 ) ) ( TRUCK-AT ?auto_51321 ?auto_51322 ) ( SURFACE-AT ?auto_51317 ?auto_51322 ) ( CLEAR ?auto_51317 ) ( LIFTING ?auto_51324 ?auto_51316 ) ( IS-CRATE ?auto_51316 ) ( ON ?auto_51314 ?auto_51313 ) ( ON ?auto_51315 ?auto_51314 ) ( ON ?auto_51317 ?auto_51315 ) ( not ( = ?auto_51313 ?auto_51314 ) ) ( not ( = ?auto_51313 ?auto_51315 ) ) ( not ( = ?auto_51313 ?auto_51317 ) ) ( not ( = ?auto_51313 ?auto_51316 ) ) ( not ( = ?auto_51313 ?auto_51318 ) ) ( not ( = ?auto_51313 ?auto_51319 ) ) ( not ( = ?auto_51314 ?auto_51315 ) ) ( not ( = ?auto_51314 ?auto_51317 ) ) ( not ( = ?auto_51314 ?auto_51316 ) ) ( not ( = ?auto_51314 ?auto_51318 ) ) ( not ( = ?auto_51314 ?auto_51319 ) ) ( not ( = ?auto_51315 ?auto_51317 ) ) ( not ( = ?auto_51315 ?auto_51316 ) ) ( not ( = ?auto_51315 ?auto_51318 ) ) ( not ( = ?auto_51315 ?auto_51319 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_51317 ?auto_51316 ?auto_51318 )
      ( MAKE-5CRATE-VERIFY ?auto_51313 ?auto_51314 ?auto_51315 ?auto_51317 ?auto_51316 ?auto_51318 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_51364 - SURFACE
      ?auto_51365 - SURFACE
      ?auto_51366 - SURFACE
      ?auto_51368 - SURFACE
      ?auto_51367 - SURFACE
      ?auto_51369 - SURFACE
    )
    :vars
    (
      ?auto_51375 - HOIST
      ?auto_51374 - PLACE
      ?auto_51371 - PLACE
      ?auto_51373 - HOIST
      ?auto_51370 - SURFACE
      ?auto_51372 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_51375 ?auto_51374 ) ( IS-CRATE ?auto_51369 ) ( not ( = ?auto_51367 ?auto_51369 ) ) ( not ( = ?auto_51368 ?auto_51367 ) ) ( not ( = ?auto_51368 ?auto_51369 ) ) ( not ( = ?auto_51371 ?auto_51374 ) ) ( HOIST-AT ?auto_51373 ?auto_51371 ) ( not ( = ?auto_51375 ?auto_51373 ) ) ( AVAILABLE ?auto_51373 ) ( SURFACE-AT ?auto_51369 ?auto_51371 ) ( ON ?auto_51369 ?auto_51370 ) ( CLEAR ?auto_51369 ) ( not ( = ?auto_51367 ?auto_51370 ) ) ( not ( = ?auto_51369 ?auto_51370 ) ) ( not ( = ?auto_51368 ?auto_51370 ) ) ( TRUCK-AT ?auto_51372 ?auto_51374 ) ( SURFACE-AT ?auto_51368 ?auto_51374 ) ( CLEAR ?auto_51368 ) ( IS-CRATE ?auto_51367 ) ( AVAILABLE ?auto_51375 ) ( IN ?auto_51367 ?auto_51372 ) ( ON ?auto_51365 ?auto_51364 ) ( ON ?auto_51366 ?auto_51365 ) ( ON ?auto_51368 ?auto_51366 ) ( not ( = ?auto_51364 ?auto_51365 ) ) ( not ( = ?auto_51364 ?auto_51366 ) ) ( not ( = ?auto_51364 ?auto_51368 ) ) ( not ( = ?auto_51364 ?auto_51367 ) ) ( not ( = ?auto_51364 ?auto_51369 ) ) ( not ( = ?auto_51364 ?auto_51370 ) ) ( not ( = ?auto_51365 ?auto_51366 ) ) ( not ( = ?auto_51365 ?auto_51368 ) ) ( not ( = ?auto_51365 ?auto_51367 ) ) ( not ( = ?auto_51365 ?auto_51369 ) ) ( not ( = ?auto_51365 ?auto_51370 ) ) ( not ( = ?auto_51366 ?auto_51368 ) ) ( not ( = ?auto_51366 ?auto_51367 ) ) ( not ( = ?auto_51366 ?auto_51369 ) ) ( not ( = ?auto_51366 ?auto_51370 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_51368 ?auto_51367 ?auto_51369 )
      ( MAKE-5CRATE-VERIFY ?auto_51364 ?auto_51365 ?auto_51366 ?auto_51368 ?auto_51367 ?auto_51369 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_52044 - SURFACE
      ?auto_52045 - SURFACE
    )
    :vars
    (
      ?auto_52049 - HOIST
      ?auto_52050 - PLACE
      ?auto_52051 - SURFACE
      ?auto_52048 - TRUCK
      ?auto_52047 - PLACE
      ?auto_52052 - HOIST
      ?auto_52046 - SURFACE
      ?auto_52053 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_52049 ?auto_52050 ) ( SURFACE-AT ?auto_52044 ?auto_52050 ) ( CLEAR ?auto_52044 ) ( IS-CRATE ?auto_52045 ) ( not ( = ?auto_52044 ?auto_52045 ) ) ( AVAILABLE ?auto_52049 ) ( ON ?auto_52044 ?auto_52051 ) ( not ( = ?auto_52051 ?auto_52044 ) ) ( not ( = ?auto_52051 ?auto_52045 ) ) ( TRUCK-AT ?auto_52048 ?auto_52047 ) ( not ( = ?auto_52047 ?auto_52050 ) ) ( HOIST-AT ?auto_52052 ?auto_52047 ) ( not ( = ?auto_52049 ?auto_52052 ) ) ( SURFACE-AT ?auto_52045 ?auto_52047 ) ( ON ?auto_52045 ?auto_52046 ) ( CLEAR ?auto_52045 ) ( not ( = ?auto_52044 ?auto_52046 ) ) ( not ( = ?auto_52045 ?auto_52046 ) ) ( not ( = ?auto_52051 ?auto_52046 ) ) ( LIFTING ?auto_52052 ?auto_52053 ) ( IS-CRATE ?auto_52053 ) ( not ( = ?auto_52044 ?auto_52053 ) ) ( not ( = ?auto_52045 ?auto_52053 ) ) ( not ( = ?auto_52051 ?auto_52053 ) ) ( not ( = ?auto_52046 ?auto_52053 ) ) )
    :subtasks
    ( ( !LOAD ?auto_52052 ?auto_52053 ?auto_52048 ?auto_52047 )
      ( MAKE-1CRATE ?auto_52044 ?auto_52045 )
      ( MAKE-1CRATE-VERIFY ?auto_52044 ?auto_52045 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_52570 - SURFACE
      ?auto_52571 - SURFACE
      ?auto_52572 - SURFACE
      ?auto_52574 - SURFACE
      ?auto_52573 - SURFACE
      ?auto_52575 - SURFACE
      ?auto_52576 - SURFACE
    )
    :vars
    (
      ?auto_52578 - HOIST
      ?auto_52577 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_52578 ?auto_52577 ) ( SURFACE-AT ?auto_52575 ?auto_52577 ) ( CLEAR ?auto_52575 ) ( LIFTING ?auto_52578 ?auto_52576 ) ( IS-CRATE ?auto_52576 ) ( not ( = ?auto_52575 ?auto_52576 ) ) ( ON ?auto_52571 ?auto_52570 ) ( ON ?auto_52572 ?auto_52571 ) ( ON ?auto_52574 ?auto_52572 ) ( ON ?auto_52573 ?auto_52574 ) ( ON ?auto_52575 ?auto_52573 ) ( not ( = ?auto_52570 ?auto_52571 ) ) ( not ( = ?auto_52570 ?auto_52572 ) ) ( not ( = ?auto_52570 ?auto_52574 ) ) ( not ( = ?auto_52570 ?auto_52573 ) ) ( not ( = ?auto_52570 ?auto_52575 ) ) ( not ( = ?auto_52570 ?auto_52576 ) ) ( not ( = ?auto_52571 ?auto_52572 ) ) ( not ( = ?auto_52571 ?auto_52574 ) ) ( not ( = ?auto_52571 ?auto_52573 ) ) ( not ( = ?auto_52571 ?auto_52575 ) ) ( not ( = ?auto_52571 ?auto_52576 ) ) ( not ( = ?auto_52572 ?auto_52574 ) ) ( not ( = ?auto_52572 ?auto_52573 ) ) ( not ( = ?auto_52572 ?auto_52575 ) ) ( not ( = ?auto_52572 ?auto_52576 ) ) ( not ( = ?auto_52574 ?auto_52573 ) ) ( not ( = ?auto_52574 ?auto_52575 ) ) ( not ( = ?auto_52574 ?auto_52576 ) ) ( not ( = ?auto_52573 ?auto_52575 ) ) ( not ( = ?auto_52573 ?auto_52576 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_52575 ?auto_52576 )
      ( MAKE-6CRATE-VERIFY ?auto_52570 ?auto_52571 ?auto_52572 ?auto_52574 ?auto_52573 ?auto_52575 ?auto_52576 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_52614 - SURFACE
      ?auto_52615 - SURFACE
      ?auto_52616 - SURFACE
      ?auto_52618 - SURFACE
      ?auto_52617 - SURFACE
      ?auto_52619 - SURFACE
      ?auto_52620 - SURFACE
    )
    :vars
    (
      ?auto_52622 - HOIST
      ?auto_52621 - PLACE
      ?auto_52623 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_52622 ?auto_52621 ) ( SURFACE-AT ?auto_52619 ?auto_52621 ) ( CLEAR ?auto_52619 ) ( IS-CRATE ?auto_52620 ) ( not ( = ?auto_52619 ?auto_52620 ) ) ( TRUCK-AT ?auto_52623 ?auto_52621 ) ( AVAILABLE ?auto_52622 ) ( IN ?auto_52620 ?auto_52623 ) ( ON ?auto_52619 ?auto_52617 ) ( not ( = ?auto_52617 ?auto_52619 ) ) ( not ( = ?auto_52617 ?auto_52620 ) ) ( ON ?auto_52615 ?auto_52614 ) ( ON ?auto_52616 ?auto_52615 ) ( ON ?auto_52618 ?auto_52616 ) ( ON ?auto_52617 ?auto_52618 ) ( not ( = ?auto_52614 ?auto_52615 ) ) ( not ( = ?auto_52614 ?auto_52616 ) ) ( not ( = ?auto_52614 ?auto_52618 ) ) ( not ( = ?auto_52614 ?auto_52617 ) ) ( not ( = ?auto_52614 ?auto_52619 ) ) ( not ( = ?auto_52614 ?auto_52620 ) ) ( not ( = ?auto_52615 ?auto_52616 ) ) ( not ( = ?auto_52615 ?auto_52618 ) ) ( not ( = ?auto_52615 ?auto_52617 ) ) ( not ( = ?auto_52615 ?auto_52619 ) ) ( not ( = ?auto_52615 ?auto_52620 ) ) ( not ( = ?auto_52616 ?auto_52618 ) ) ( not ( = ?auto_52616 ?auto_52617 ) ) ( not ( = ?auto_52616 ?auto_52619 ) ) ( not ( = ?auto_52616 ?auto_52620 ) ) ( not ( = ?auto_52618 ?auto_52617 ) ) ( not ( = ?auto_52618 ?auto_52619 ) ) ( not ( = ?auto_52618 ?auto_52620 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_52617 ?auto_52619 ?auto_52620 )
      ( MAKE-6CRATE-VERIFY ?auto_52614 ?auto_52615 ?auto_52616 ?auto_52618 ?auto_52617 ?auto_52619 ?auto_52620 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_52665 - SURFACE
      ?auto_52666 - SURFACE
      ?auto_52667 - SURFACE
      ?auto_52669 - SURFACE
      ?auto_52668 - SURFACE
      ?auto_52670 - SURFACE
      ?auto_52671 - SURFACE
    )
    :vars
    (
      ?auto_52672 - HOIST
      ?auto_52674 - PLACE
      ?auto_52675 - TRUCK
      ?auto_52673 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_52672 ?auto_52674 ) ( SURFACE-AT ?auto_52670 ?auto_52674 ) ( CLEAR ?auto_52670 ) ( IS-CRATE ?auto_52671 ) ( not ( = ?auto_52670 ?auto_52671 ) ) ( AVAILABLE ?auto_52672 ) ( IN ?auto_52671 ?auto_52675 ) ( ON ?auto_52670 ?auto_52668 ) ( not ( = ?auto_52668 ?auto_52670 ) ) ( not ( = ?auto_52668 ?auto_52671 ) ) ( TRUCK-AT ?auto_52675 ?auto_52673 ) ( not ( = ?auto_52673 ?auto_52674 ) ) ( ON ?auto_52666 ?auto_52665 ) ( ON ?auto_52667 ?auto_52666 ) ( ON ?auto_52669 ?auto_52667 ) ( ON ?auto_52668 ?auto_52669 ) ( not ( = ?auto_52665 ?auto_52666 ) ) ( not ( = ?auto_52665 ?auto_52667 ) ) ( not ( = ?auto_52665 ?auto_52669 ) ) ( not ( = ?auto_52665 ?auto_52668 ) ) ( not ( = ?auto_52665 ?auto_52670 ) ) ( not ( = ?auto_52665 ?auto_52671 ) ) ( not ( = ?auto_52666 ?auto_52667 ) ) ( not ( = ?auto_52666 ?auto_52669 ) ) ( not ( = ?auto_52666 ?auto_52668 ) ) ( not ( = ?auto_52666 ?auto_52670 ) ) ( not ( = ?auto_52666 ?auto_52671 ) ) ( not ( = ?auto_52667 ?auto_52669 ) ) ( not ( = ?auto_52667 ?auto_52668 ) ) ( not ( = ?auto_52667 ?auto_52670 ) ) ( not ( = ?auto_52667 ?auto_52671 ) ) ( not ( = ?auto_52669 ?auto_52668 ) ) ( not ( = ?auto_52669 ?auto_52670 ) ) ( not ( = ?auto_52669 ?auto_52671 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_52668 ?auto_52670 ?auto_52671 )
      ( MAKE-6CRATE-VERIFY ?auto_52665 ?auto_52666 ?auto_52667 ?auto_52669 ?auto_52668 ?auto_52670 ?auto_52671 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_52722 - SURFACE
      ?auto_52723 - SURFACE
      ?auto_52724 - SURFACE
      ?auto_52726 - SURFACE
      ?auto_52725 - SURFACE
      ?auto_52727 - SURFACE
      ?auto_52728 - SURFACE
    )
    :vars
    (
      ?auto_52729 - HOIST
      ?auto_52731 - PLACE
      ?auto_52730 - TRUCK
      ?auto_52733 - PLACE
      ?auto_52732 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_52729 ?auto_52731 ) ( SURFACE-AT ?auto_52727 ?auto_52731 ) ( CLEAR ?auto_52727 ) ( IS-CRATE ?auto_52728 ) ( not ( = ?auto_52727 ?auto_52728 ) ) ( AVAILABLE ?auto_52729 ) ( ON ?auto_52727 ?auto_52725 ) ( not ( = ?auto_52725 ?auto_52727 ) ) ( not ( = ?auto_52725 ?auto_52728 ) ) ( TRUCK-AT ?auto_52730 ?auto_52733 ) ( not ( = ?auto_52733 ?auto_52731 ) ) ( HOIST-AT ?auto_52732 ?auto_52733 ) ( LIFTING ?auto_52732 ?auto_52728 ) ( not ( = ?auto_52729 ?auto_52732 ) ) ( ON ?auto_52723 ?auto_52722 ) ( ON ?auto_52724 ?auto_52723 ) ( ON ?auto_52726 ?auto_52724 ) ( ON ?auto_52725 ?auto_52726 ) ( not ( = ?auto_52722 ?auto_52723 ) ) ( not ( = ?auto_52722 ?auto_52724 ) ) ( not ( = ?auto_52722 ?auto_52726 ) ) ( not ( = ?auto_52722 ?auto_52725 ) ) ( not ( = ?auto_52722 ?auto_52727 ) ) ( not ( = ?auto_52722 ?auto_52728 ) ) ( not ( = ?auto_52723 ?auto_52724 ) ) ( not ( = ?auto_52723 ?auto_52726 ) ) ( not ( = ?auto_52723 ?auto_52725 ) ) ( not ( = ?auto_52723 ?auto_52727 ) ) ( not ( = ?auto_52723 ?auto_52728 ) ) ( not ( = ?auto_52724 ?auto_52726 ) ) ( not ( = ?auto_52724 ?auto_52725 ) ) ( not ( = ?auto_52724 ?auto_52727 ) ) ( not ( = ?auto_52724 ?auto_52728 ) ) ( not ( = ?auto_52726 ?auto_52725 ) ) ( not ( = ?auto_52726 ?auto_52727 ) ) ( not ( = ?auto_52726 ?auto_52728 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_52725 ?auto_52727 ?auto_52728 )
      ( MAKE-6CRATE-VERIFY ?auto_52722 ?auto_52723 ?auto_52724 ?auto_52726 ?auto_52725 ?auto_52727 ?auto_52728 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_52785 - SURFACE
      ?auto_52786 - SURFACE
      ?auto_52787 - SURFACE
      ?auto_52789 - SURFACE
      ?auto_52788 - SURFACE
      ?auto_52790 - SURFACE
      ?auto_52791 - SURFACE
    )
    :vars
    (
      ?auto_52793 - HOIST
      ?auto_52792 - PLACE
      ?auto_52794 - TRUCK
      ?auto_52797 - PLACE
      ?auto_52796 - HOIST
      ?auto_52795 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_52793 ?auto_52792 ) ( SURFACE-AT ?auto_52790 ?auto_52792 ) ( CLEAR ?auto_52790 ) ( IS-CRATE ?auto_52791 ) ( not ( = ?auto_52790 ?auto_52791 ) ) ( AVAILABLE ?auto_52793 ) ( ON ?auto_52790 ?auto_52788 ) ( not ( = ?auto_52788 ?auto_52790 ) ) ( not ( = ?auto_52788 ?auto_52791 ) ) ( TRUCK-AT ?auto_52794 ?auto_52797 ) ( not ( = ?auto_52797 ?auto_52792 ) ) ( HOIST-AT ?auto_52796 ?auto_52797 ) ( not ( = ?auto_52793 ?auto_52796 ) ) ( AVAILABLE ?auto_52796 ) ( SURFACE-AT ?auto_52791 ?auto_52797 ) ( ON ?auto_52791 ?auto_52795 ) ( CLEAR ?auto_52791 ) ( not ( = ?auto_52790 ?auto_52795 ) ) ( not ( = ?auto_52791 ?auto_52795 ) ) ( not ( = ?auto_52788 ?auto_52795 ) ) ( ON ?auto_52786 ?auto_52785 ) ( ON ?auto_52787 ?auto_52786 ) ( ON ?auto_52789 ?auto_52787 ) ( ON ?auto_52788 ?auto_52789 ) ( not ( = ?auto_52785 ?auto_52786 ) ) ( not ( = ?auto_52785 ?auto_52787 ) ) ( not ( = ?auto_52785 ?auto_52789 ) ) ( not ( = ?auto_52785 ?auto_52788 ) ) ( not ( = ?auto_52785 ?auto_52790 ) ) ( not ( = ?auto_52785 ?auto_52791 ) ) ( not ( = ?auto_52785 ?auto_52795 ) ) ( not ( = ?auto_52786 ?auto_52787 ) ) ( not ( = ?auto_52786 ?auto_52789 ) ) ( not ( = ?auto_52786 ?auto_52788 ) ) ( not ( = ?auto_52786 ?auto_52790 ) ) ( not ( = ?auto_52786 ?auto_52791 ) ) ( not ( = ?auto_52786 ?auto_52795 ) ) ( not ( = ?auto_52787 ?auto_52789 ) ) ( not ( = ?auto_52787 ?auto_52788 ) ) ( not ( = ?auto_52787 ?auto_52790 ) ) ( not ( = ?auto_52787 ?auto_52791 ) ) ( not ( = ?auto_52787 ?auto_52795 ) ) ( not ( = ?auto_52789 ?auto_52788 ) ) ( not ( = ?auto_52789 ?auto_52790 ) ) ( not ( = ?auto_52789 ?auto_52791 ) ) ( not ( = ?auto_52789 ?auto_52795 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_52788 ?auto_52790 ?auto_52791 )
      ( MAKE-6CRATE-VERIFY ?auto_52785 ?auto_52786 ?auto_52787 ?auto_52789 ?auto_52788 ?auto_52790 ?auto_52791 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_52849 - SURFACE
      ?auto_52850 - SURFACE
      ?auto_52851 - SURFACE
      ?auto_52853 - SURFACE
      ?auto_52852 - SURFACE
      ?auto_52854 - SURFACE
      ?auto_52855 - SURFACE
    )
    :vars
    (
      ?auto_52859 - HOIST
      ?auto_52860 - PLACE
      ?auto_52858 - PLACE
      ?auto_52856 - HOIST
      ?auto_52861 - SURFACE
      ?auto_52857 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_52859 ?auto_52860 ) ( SURFACE-AT ?auto_52854 ?auto_52860 ) ( CLEAR ?auto_52854 ) ( IS-CRATE ?auto_52855 ) ( not ( = ?auto_52854 ?auto_52855 ) ) ( AVAILABLE ?auto_52859 ) ( ON ?auto_52854 ?auto_52852 ) ( not ( = ?auto_52852 ?auto_52854 ) ) ( not ( = ?auto_52852 ?auto_52855 ) ) ( not ( = ?auto_52858 ?auto_52860 ) ) ( HOIST-AT ?auto_52856 ?auto_52858 ) ( not ( = ?auto_52859 ?auto_52856 ) ) ( AVAILABLE ?auto_52856 ) ( SURFACE-AT ?auto_52855 ?auto_52858 ) ( ON ?auto_52855 ?auto_52861 ) ( CLEAR ?auto_52855 ) ( not ( = ?auto_52854 ?auto_52861 ) ) ( not ( = ?auto_52855 ?auto_52861 ) ) ( not ( = ?auto_52852 ?auto_52861 ) ) ( TRUCK-AT ?auto_52857 ?auto_52860 ) ( ON ?auto_52850 ?auto_52849 ) ( ON ?auto_52851 ?auto_52850 ) ( ON ?auto_52853 ?auto_52851 ) ( ON ?auto_52852 ?auto_52853 ) ( not ( = ?auto_52849 ?auto_52850 ) ) ( not ( = ?auto_52849 ?auto_52851 ) ) ( not ( = ?auto_52849 ?auto_52853 ) ) ( not ( = ?auto_52849 ?auto_52852 ) ) ( not ( = ?auto_52849 ?auto_52854 ) ) ( not ( = ?auto_52849 ?auto_52855 ) ) ( not ( = ?auto_52849 ?auto_52861 ) ) ( not ( = ?auto_52850 ?auto_52851 ) ) ( not ( = ?auto_52850 ?auto_52853 ) ) ( not ( = ?auto_52850 ?auto_52852 ) ) ( not ( = ?auto_52850 ?auto_52854 ) ) ( not ( = ?auto_52850 ?auto_52855 ) ) ( not ( = ?auto_52850 ?auto_52861 ) ) ( not ( = ?auto_52851 ?auto_52853 ) ) ( not ( = ?auto_52851 ?auto_52852 ) ) ( not ( = ?auto_52851 ?auto_52854 ) ) ( not ( = ?auto_52851 ?auto_52855 ) ) ( not ( = ?auto_52851 ?auto_52861 ) ) ( not ( = ?auto_52853 ?auto_52852 ) ) ( not ( = ?auto_52853 ?auto_52854 ) ) ( not ( = ?auto_52853 ?auto_52855 ) ) ( not ( = ?auto_52853 ?auto_52861 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_52852 ?auto_52854 ?auto_52855 )
      ( MAKE-6CRATE-VERIFY ?auto_52849 ?auto_52850 ?auto_52851 ?auto_52853 ?auto_52852 ?auto_52854 ?auto_52855 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_52913 - SURFACE
      ?auto_52914 - SURFACE
      ?auto_52915 - SURFACE
      ?auto_52917 - SURFACE
      ?auto_52916 - SURFACE
      ?auto_52918 - SURFACE
      ?auto_52919 - SURFACE
    )
    :vars
    (
      ?auto_52924 - HOIST
      ?auto_52925 - PLACE
      ?auto_52921 - PLACE
      ?auto_52920 - HOIST
      ?auto_52923 - SURFACE
      ?auto_52922 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_52924 ?auto_52925 ) ( IS-CRATE ?auto_52919 ) ( not ( = ?auto_52918 ?auto_52919 ) ) ( not ( = ?auto_52916 ?auto_52918 ) ) ( not ( = ?auto_52916 ?auto_52919 ) ) ( not ( = ?auto_52921 ?auto_52925 ) ) ( HOIST-AT ?auto_52920 ?auto_52921 ) ( not ( = ?auto_52924 ?auto_52920 ) ) ( AVAILABLE ?auto_52920 ) ( SURFACE-AT ?auto_52919 ?auto_52921 ) ( ON ?auto_52919 ?auto_52923 ) ( CLEAR ?auto_52919 ) ( not ( = ?auto_52918 ?auto_52923 ) ) ( not ( = ?auto_52919 ?auto_52923 ) ) ( not ( = ?auto_52916 ?auto_52923 ) ) ( TRUCK-AT ?auto_52922 ?auto_52925 ) ( SURFACE-AT ?auto_52916 ?auto_52925 ) ( CLEAR ?auto_52916 ) ( LIFTING ?auto_52924 ?auto_52918 ) ( IS-CRATE ?auto_52918 ) ( ON ?auto_52914 ?auto_52913 ) ( ON ?auto_52915 ?auto_52914 ) ( ON ?auto_52917 ?auto_52915 ) ( ON ?auto_52916 ?auto_52917 ) ( not ( = ?auto_52913 ?auto_52914 ) ) ( not ( = ?auto_52913 ?auto_52915 ) ) ( not ( = ?auto_52913 ?auto_52917 ) ) ( not ( = ?auto_52913 ?auto_52916 ) ) ( not ( = ?auto_52913 ?auto_52918 ) ) ( not ( = ?auto_52913 ?auto_52919 ) ) ( not ( = ?auto_52913 ?auto_52923 ) ) ( not ( = ?auto_52914 ?auto_52915 ) ) ( not ( = ?auto_52914 ?auto_52917 ) ) ( not ( = ?auto_52914 ?auto_52916 ) ) ( not ( = ?auto_52914 ?auto_52918 ) ) ( not ( = ?auto_52914 ?auto_52919 ) ) ( not ( = ?auto_52914 ?auto_52923 ) ) ( not ( = ?auto_52915 ?auto_52917 ) ) ( not ( = ?auto_52915 ?auto_52916 ) ) ( not ( = ?auto_52915 ?auto_52918 ) ) ( not ( = ?auto_52915 ?auto_52919 ) ) ( not ( = ?auto_52915 ?auto_52923 ) ) ( not ( = ?auto_52917 ?auto_52916 ) ) ( not ( = ?auto_52917 ?auto_52918 ) ) ( not ( = ?auto_52917 ?auto_52919 ) ) ( not ( = ?auto_52917 ?auto_52923 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_52916 ?auto_52918 ?auto_52919 )
      ( MAKE-6CRATE-VERIFY ?auto_52913 ?auto_52914 ?auto_52915 ?auto_52917 ?auto_52916 ?auto_52918 ?auto_52919 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_52977 - SURFACE
      ?auto_52978 - SURFACE
      ?auto_52979 - SURFACE
      ?auto_52981 - SURFACE
      ?auto_52980 - SURFACE
      ?auto_52982 - SURFACE
      ?auto_52983 - SURFACE
    )
    :vars
    (
      ?auto_52987 - HOIST
      ?auto_52989 - PLACE
      ?auto_52984 - PLACE
      ?auto_52985 - HOIST
      ?auto_52986 - SURFACE
      ?auto_52988 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_52987 ?auto_52989 ) ( IS-CRATE ?auto_52983 ) ( not ( = ?auto_52982 ?auto_52983 ) ) ( not ( = ?auto_52980 ?auto_52982 ) ) ( not ( = ?auto_52980 ?auto_52983 ) ) ( not ( = ?auto_52984 ?auto_52989 ) ) ( HOIST-AT ?auto_52985 ?auto_52984 ) ( not ( = ?auto_52987 ?auto_52985 ) ) ( AVAILABLE ?auto_52985 ) ( SURFACE-AT ?auto_52983 ?auto_52984 ) ( ON ?auto_52983 ?auto_52986 ) ( CLEAR ?auto_52983 ) ( not ( = ?auto_52982 ?auto_52986 ) ) ( not ( = ?auto_52983 ?auto_52986 ) ) ( not ( = ?auto_52980 ?auto_52986 ) ) ( TRUCK-AT ?auto_52988 ?auto_52989 ) ( SURFACE-AT ?auto_52980 ?auto_52989 ) ( CLEAR ?auto_52980 ) ( IS-CRATE ?auto_52982 ) ( AVAILABLE ?auto_52987 ) ( IN ?auto_52982 ?auto_52988 ) ( ON ?auto_52978 ?auto_52977 ) ( ON ?auto_52979 ?auto_52978 ) ( ON ?auto_52981 ?auto_52979 ) ( ON ?auto_52980 ?auto_52981 ) ( not ( = ?auto_52977 ?auto_52978 ) ) ( not ( = ?auto_52977 ?auto_52979 ) ) ( not ( = ?auto_52977 ?auto_52981 ) ) ( not ( = ?auto_52977 ?auto_52980 ) ) ( not ( = ?auto_52977 ?auto_52982 ) ) ( not ( = ?auto_52977 ?auto_52983 ) ) ( not ( = ?auto_52977 ?auto_52986 ) ) ( not ( = ?auto_52978 ?auto_52979 ) ) ( not ( = ?auto_52978 ?auto_52981 ) ) ( not ( = ?auto_52978 ?auto_52980 ) ) ( not ( = ?auto_52978 ?auto_52982 ) ) ( not ( = ?auto_52978 ?auto_52983 ) ) ( not ( = ?auto_52978 ?auto_52986 ) ) ( not ( = ?auto_52979 ?auto_52981 ) ) ( not ( = ?auto_52979 ?auto_52980 ) ) ( not ( = ?auto_52979 ?auto_52982 ) ) ( not ( = ?auto_52979 ?auto_52983 ) ) ( not ( = ?auto_52979 ?auto_52986 ) ) ( not ( = ?auto_52981 ?auto_52980 ) ) ( not ( = ?auto_52981 ?auto_52982 ) ) ( not ( = ?auto_52981 ?auto_52983 ) ) ( not ( = ?auto_52981 ?auto_52986 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_52980 ?auto_52982 ?auto_52983 )
      ( MAKE-6CRATE-VERIFY ?auto_52977 ?auto_52978 ?auto_52979 ?auto_52981 ?auto_52980 ?auto_52982 ?auto_52983 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_54244 - SURFACE
      ?auto_54245 - SURFACE
    )
    :vars
    (
      ?auto_54252 - HOIST
      ?auto_54250 - PLACE
      ?auto_54249 - SURFACE
      ?auto_54246 - PLACE
      ?auto_54247 - HOIST
      ?auto_54248 - SURFACE
      ?auto_54251 - TRUCK
      ?auto_54253 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_54252 ?auto_54250 ) ( SURFACE-AT ?auto_54244 ?auto_54250 ) ( CLEAR ?auto_54244 ) ( IS-CRATE ?auto_54245 ) ( not ( = ?auto_54244 ?auto_54245 ) ) ( ON ?auto_54244 ?auto_54249 ) ( not ( = ?auto_54249 ?auto_54244 ) ) ( not ( = ?auto_54249 ?auto_54245 ) ) ( not ( = ?auto_54246 ?auto_54250 ) ) ( HOIST-AT ?auto_54247 ?auto_54246 ) ( not ( = ?auto_54252 ?auto_54247 ) ) ( AVAILABLE ?auto_54247 ) ( SURFACE-AT ?auto_54245 ?auto_54246 ) ( ON ?auto_54245 ?auto_54248 ) ( CLEAR ?auto_54245 ) ( not ( = ?auto_54244 ?auto_54248 ) ) ( not ( = ?auto_54245 ?auto_54248 ) ) ( not ( = ?auto_54249 ?auto_54248 ) ) ( TRUCK-AT ?auto_54251 ?auto_54250 ) ( LIFTING ?auto_54252 ?auto_54253 ) ( IS-CRATE ?auto_54253 ) ( not ( = ?auto_54244 ?auto_54253 ) ) ( not ( = ?auto_54245 ?auto_54253 ) ) ( not ( = ?auto_54249 ?auto_54253 ) ) ( not ( = ?auto_54248 ?auto_54253 ) ) )
    :subtasks
    ( ( !LOAD ?auto_54252 ?auto_54253 ?auto_54251 ?auto_54250 )
      ( MAKE-1CRATE ?auto_54244 ?auto_54245 )
      ( MAKE-1CRATE-VERIFY ?auto_54244 ?auto_54245 ) )
  )

)

