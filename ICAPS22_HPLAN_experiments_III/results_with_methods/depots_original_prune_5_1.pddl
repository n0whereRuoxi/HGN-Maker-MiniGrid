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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15469 - SURFACE
      ?auto_15470 - SURFACE
    )
    :vars
    (
      ?auto_15471 - HOIST
      ?auto_15472 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15471 ?auto_15472 ) ( SURFACE-AT ?auto_15469 ?auto_15472 ) ( CLEAR ?auto_15469 ) ( LIFTING ?auto_15471 ?auto_15470 ) ( IS-CRATE ?auto_15470 ) ( not ( = ?auto_15469 ?auto_15470 ) ) )
    :subtasks
    ( ( !DROP ?auto_15471 ?auto_15470 ?auto_15469 ?auto_15472 )
      ( MAKE-1CRATE-VERIFY ?auto_15469 ?auto_15470 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15473 - SURFACE
      ?auto_15474 - SURFACE
    )
    :vars
    (
      ?auto_15475 - HOIST
      ?auto_15476 - PLACE
      ?auto_15477 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15475 ?auto_15476 ) ( SURFACE-AT ?auto_15473 ?auto_15476 ) ( CLEAR ?auto_15473 ) ( IS-CRATE ?auto_15474 ) ( not ( = ?auto_15473 ?auto_15474 ) ) ( TRUCK-AT ?auto_15477 ?auto_15476 ) ( AVAILABLE ?auto_15475 ) ( IN ?auto_15474 ?auto_15477 ) )
    :subtasks
    ( ( !UNLOAD ?auto_15475 ?auto_15474 ?auto_15477 ?auto_15476 )
      ( MAKE-1CRATE ?auto_15473 ?auto_15474 )
      ( MAKE-1CRATE-VERIFY ?auto_15473 ?auto_15474 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15478 - SURFACE
      ?auto_15479 - SURFACE
    )
    :vars
    (
      ?auto_15481 - HOIST
      ?auto_15480 - PLACE
      ?auto_15482 - TRUCK
      ?auto_15483 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15481 ?auto_15480 ) ( SURFACE-AT ?auto_15478 ?auto_15480 ) ( CLEAR ?auto_15478 ) ( IS-CRATE ?auto_15479 ) ( not ( = ?auto_15478 ?auto_15479 ) ) ( AVAILABLE ?auto_15481 ) ( IN ?auto_15479 ?auto_15482 ) ( TRUCK-AT ?auto_15482 ?auto_15483 ) ( not ( = ?auto_15483 ?auto_15480 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15482 ?auto_15483 ?auto_15480 )
      ( MAKE-1CRATE ?auto_15478 ?auto_15479 )
      ( MAKE-1CRATE-VERIFY ?auto_15478 ?auto_15479 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15484 - SURFACE
      ?auto_15485 - SURFACE
    )
    :vars
    (
      ?auto_15487 - HOIST
      ?auto_15486 - PLACE
      ?auto_15488 - TRUCK
      ?auto_15489 - PLACE
      ?auto_15490 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_15487 ?auto_15486 ) ( SURFACE-AT ?auto_15484 ?auto_15486 ) ( CLEAR ?auto_15484 ) ( IS-CRATE ?auto_15485 ) ( not ( = ?auto_15484 ?auto_15485 ) ) ( AVAILABLE ?auto_15487 ) ( TRUCK-AT ?auto_15488 ?auto_15489 ) ( not ( = ?auto_15489 ?auto_15486 ) ) ( HOIST-AT ?auto_15490 ?auto_15489 ) ( LIFTING ?auto_15490 ?auto_15485 ) ( not ( = ?auto_15487 ?auto_15490 ) ) )
    :subtasks
    ( ( !LOAD ?auto_15490 ?auto_15485 ?auto_15488 ?auto_15489 )
      ( MAKE-1CRATE ?auto_15484 ?auto_15485 )
      ( MAKE-1CRATE-VERIFY ?auto_15484 ?auto_15485 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15491 - SURFACE
      ?auto_15492 - SURFACE
    )
    :vars
    (
      ?auto_15493 - HOIST
      ?auto_15496 - PLACE
      ?auto_15494 - TRUCK
      ?auto_15495 - PLACE
      ?auto_15497 - HOIST
      ?auto_15498 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15493 ?auto_15496 ) ( SURFACE-AT ?auto_15491 ?auto_15496 ) ( CLEAR ?auto_15491 ) ( IS-CRATE ?auto_15492 ) ( not ( = ?auto_15491 ?auto_15492 ) ) ( AVAILABLE ?auto_15493 ) ( TRUCK-AT ?auto_15494 ?auto_15495 ) ( not ( = ?auto_15495 ?auto_15496 ) ) ( HOIST-AT ?auto_15497 ?auto_15495 ) ( not ( = ?auto_15493 ?auto_15497 ) ) ( AVAILABLE ?auto_15497 ) ( SURFACE-AT ?auto_15492 ?auto_15495 ) ( ON ?auto_15492 ?auto_15498 ) ( CLEAR ?auto_15492 ) ( not ( = ?auto_15491 ?auto_15498 ) ) ( not ( = ?auto_15492 ?auto_15498 ) ) )
    :subtasks
    ( ( !LIFT ?auto_15497 ?auto_15492 ?auto_15498 ?auto_15495 )
      ( MAKE-1CRATE ?auto_15491 ?auto_15492 )
      ( MAKE-1CRATE-VERIFY ?auto_15491 ?auto_15492 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15499 - SURFACE
      ?auto_15500 - SURFACE
    )
    :vars
    (
      ?auto_15504 - HOIST
      ?auto_15501 - PLACE
      ?auto_15506 - PLACE
      ?auto_15505 - HOIST
      ?auto_15502 - SURFACE
      ?auto_15503 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15504 ?auto_15501 ) ( SURFACE-AT ?auto_15499 ?auto_15501 ) ( CLEAR ?auto_15499 ) ( IS-CRATE ?auto_15500 ) ( not ( = ?auto_15499 ?auto_15500 ) ) ( AVAILABLE ?auto_15504 ) ( not ( = ?auto_15506 ?auto_15501 ) ) ( HOIST-AT ?auto_15505 ?auto_15506 ) ( not ( = ?auto_15504 ?auto_15505 ) ) ( AVAILABLE ?auto_15505 ) ( SURFACE-AT ?auto_15500 ?auto_15506 ) ( ON ?auto_15500 ?auto_15502 ) ( CLEAR ?auto_15500 ) ( not ( = ?auto_15499 ?auto_15502 ) ) ( not ( = ?auto_15500 ?auto_15502 ) ) ( TRUCK-AT ?auto_15503 ?auto_15501 ) )
    :subtasks
    ( ( !DRIVE ?auto_15503 ?auto_15501 ?auto_15506 )
      ( MAKE-1CRATE ?auto_15499 ?auto_15500 )
      ( MAKE-1CRATE-VERIFY ?auto_15499 ?auto_15500 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15516 - SURFACE
      ?auto_15517 - SURFACE
      ?auto_15518 - SURFACE
    )
    :vars
    (
      ?auto_15519 - HOIST
      ?auto_15520 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15519 ?auto_15520 ) ( SURFACE-AT ?auto_15517 ?auto_15520 ) ( CLEAR ?auto_15517 ) ( LIFTING ?auto_15519 ?auto_15518 ) ( IS-CRATE ?auto_15518 ) ( not ( = ?auto_15517 ?auto_15518 ) ) ( ON ?auto_15517 ?auto_15516 ) ( not ( = ?auto_15516 ?auto_15517 ) ) ( not ( = ?auto_15516 ?auto_15518 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15517 ?auto_15518 )
      ( MAKE-2CRATE-VERIFY ?auto_15516 ?auto_15517 ?auto_15518 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15526 - SURFACE
      ?auto_15527 - SURFACE
      ?auto_15528 - SURFACE
    )
    :vars
    (
      ?auto_15530 - HOIST
      ?auto_15529 - PLACE
      ?auto_15531 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15530 ?auto_15529 ) ( SURFACE-AT ?auto_15527 ?auto_15529 ) ( CLEAR ?auto_15527 ) ( IS-CRATE ?auto_15528 ) ( not ( = ?auto_15527 ?auto_15528 ) ) ( TRUCK-AT ?auto_15531 ?auto_15529 ) ( AVAILABLE ?auto_15530 ) ( IN ?auto_15528 ?auto_15531 ) ( ON ?auto_15527 ?auto_15526 ) ( not ( = ?auto_15526 ?auto_15527 ) ) ( not ( = ?auto_15526 ?auto_15528 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15527 ?auto_15528 )
      ( MAKE-2CRATE-VERIFY ?auto_15526 ?auto_15527 ?auto_15528 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15532 - SURFACE
      ?auto_15533 - SURFACE
    )
    :vars
    (
      ?auto_15537 - HOIST
      ?auto_15534 - PLACE
      ?auto_15535 - TRUCK
      ?auto_15536 - SURFACE
      ?auto_15538 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15537 ?auto_15534 ) ( SURFACE-AT ?auto_15532 ?auto_15534 ) ( CLEAR ?auto_15532 ) ( IS-CRATE ?auto_15533 ) ( not ( = ?auto_15532 ?auto_15533 ) ) ( AVAILABLE ?auto_15537 ) ( IN ?auto_15533 ?auto_15535 ) ( ON ?auto_15532 ?auto_15536 ) ( not ( = ?auto_15536 ?auto_15532 ) ) ( not ( = ?auto_15536 ?auto_15533 ) ) ( TRUCK-AT ?auto_15535 ?auto_15538 ) ( not ( = ?auto_15538 ?auto_15534 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15535 ?auto_15538 ?auto_15534 )
      ( MAKE-2CRATE ?auto_15536 ?auto_15532 ?auto_15533 )
      ( MAKE-1CRATE-VERIFY ?auto_15532 ?auto_15533 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15539 - SURFACE
      ?auto_15540 - SURFACE
      ?auto_15541 - SURFACE
    )
    :vars
    (
      ?auto_15544 - HOIST
      ?auto_15545 - PLACE
      ?auto_15542 - TRUCK
      ?auto_15543 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15544 ?auto_15545 ) ( SURFACE-AT ?auto_15540 ?auto_15545 ) ( CLEAR ?auto_15540 ) ( IS-CRATE ?auto_15541 ) ( not ( = ?auto_15540 ?auto_15541 ) ) ( AVAILABLE ?auto_15544 ) ( IN ?auto_15541 ?auto_15542 ) ( ON ?auto_15540 ?auto_15539 ) ( not ( = ?auto_15539 ?auto_15540 ) ) ( not ( = ?auto_15539 ?auto_15541 ) ) ( TRUCK-AT ?auto_15542 ?auto_15543 ) ( not ( = ?auto_15543 ?auto_15545 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15540 ?auto_15541 )
      ( MAKE-2CRATE-VERIFY ?auto_15539 ?auto_15540 ?auto_15541 ) )
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
      ?auto_15552 - PLACE
      ?auto_15550 - SURFACE
      ?auto_15549 - TRUCK
      ?auto_15551 - PLACE
      ?auto_15553 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_15548 ?auto_15552 ) ( SURFACE-AT ?auto_15546 ?auto_15552 ) ( CLEAR ?auto_15546 ) ( IS-CRATE ?auto_15547 ) ( not ( = ?auto_15546 ?auto_15547 ) ) ( AVAILABLE ?auto_15548 ) ( ON ?auto_15546 ?auto_15550 ) ( not ( = ?auto_15550 ?auto_15546 ) ) ( not ( = ?auto_15550 ?auto_15547 ) ) ( TRUCK-AT ?auto_15549 ?auto_15551 ) ( not ( = ?auto_15551 ?auto_15552 ) ) ( HOIST-AT ?auto_15553 ?auto_15551 ) ( LIFTING ?auto_15553 ?auto_15547 ) ( not ( = ?auto_15548 ?auto_15553 ) ) )
    :subtasks
    ( ( !LOAD ?auto_15553 ?auto_15547 ?auto_15549 ?auto_15551 )
      ( MAKE-2CRATE ?auto_15550 ?auto_15546 ?auto_15547 )
      ( MAKE-1CRATE-VERIFY ?auto_15546 ?auto_15547 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15554 - SURFACE
      ?auto_15555 - SURFACE
      ?auto_15556 - SURFACE
    )
    :vars
    (
      ?auto_15561 - HOIST
      ?auto_15558 - PLACE
      ?auto_15560 - TRUCK
      ?auto_15557 - PLACE
      ?auto_15559 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_15561 ?auto_15558 ) ( SURFACE-AT ?auto_15555 ?auto_15558 ) ( CLEAR ?auto_15555 ) ( IS-CRATE ?auto_15556 ) ( not ( = ?auto_15555 ?auto_15556 ) ) ( AVAILABLE ?auto_15561 ) ( ON ?auto_15555 ?auto_15554 ) ( not ( = ?auto_15554 ?auto_15555 ) ) ( not ( = ?auto_15554 ?auto_15556 ) ) ( TRUCK-AT ?auto_15560 ?auto_15557 ) ( not ( = ?auto_15557 ?auto_15558 ) ) ( HOIST-AT ?auto_15559 ?auto_15557 ) ( LIFTING ?auto_15559 ?auto_15556 ) ( not ( = ?auto_15561 ?auto_15559 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15555 ?auto_15556 )
      ( MAKE-2CRATE-VERIFY ?auto_15554 ?auto_15555 ?auto_15556 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15562 - SURFACE
      ?auto_15563 - SURFACE
    )
    :vars
    (
      ?auto_15567 - HOIST
      ?auto_15569 - PLACE
      ?auto_15564 - SURFACE
      ?auto_15566 - TRUCK
      ?auto_15565 - PLACE
      ?auto_15568 - HOIST
      ?auto_15570 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15567 ?auto_15569 ) ( SURFACE-AT ?auto_15562 ?auto_15569 ) ( CLEAR ?auto_15562 ) ( IS-CRATE ?auto_15563 ) ( not ( = ?auto_15562 ?auto_15563 ) ) ( AVAILABLE ?auto_15567 ) ( ON ?auto_15562 ?auto_15564 ) ( not ( = ?auto_15564 ?auto_15562 ) ) ( not ( = ?auto_15564 ?auto_15563 ) ) ( TRUCK-AT ?auto_15566 ?auto_15565 ) ( not ( = ?auto_15565 ?auto_15569 ) ) ( HOIST-AT ?auto_15568 ?auto_15565 ) ( not ( = ?auto_15567 ?auto_15568 ) ) ( AVAILABLE ?auto_15568 ) ( SURFACE-AT ?auto_15563 ?auto_15565 ) ( ON ?auto_15563 ?auto_15570 ) ( CLEAR ?auto_15563 ) ( not ( = ?auto_15562 ?auto_15570 ) ) ( not ( = ?auto_15563 ?auto_15570 ) ) ( not ( = ?auto_15564 ?auto_15570 ) ) )
    :subtasks
    ( ( !LIFT ?auto_15568 ?auto_15563 ?auto_15570 ?auto_15565 )
      ( MAKE-2CRATE ?auto_15564 ?auto_15562 ?auto_15563 )
      ( MAKE-1CRATE-VERIFY ?auto_15562 ?auto_15563 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15571 - SURFACE
      ?auto_15572 - SURFACE
      ?auto_15573 - SURFACE
    )
    :vars
    (
      ?auto_15577 - HOIST
      ?auto_15578 - PLACE
      ?auto_15575 - TRUCK
      ?auto_15579 - PLACE
      ?auto_15576 - HOIST
      ?auto_15574 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15577 ?auto_15578 ) ( SURFACE-AT ?auto_15572 ?auto_15578 ) ( CLEAR ?auto_15572 ) ( IS-CRATE ?auto_15573 ) ( not ( = ?auto_15572 ?auto_15573 ) ) ( AVAILABLE ?auto_15577 ) ( ON ?auto_15572 ?auto_15571 ) ( not ( = ?auto_15571 ?auto_15572 ) ) ( not ( = ?auto_15571 ?auto_15573 ) ) ( TRUCK-AT ?auto_15575 ?auto_15579 ) ( not ( = ?auto_15579 ?auto_15578 ) ) ( HOIST-AT ?auto_15576 ?auto_15579 ) ( not ( = ?auto_15577 ?auto_15576 ) ) ( AVAILABLE ?auto_15576 ) ( SURFACE-AT ?auto_15573 ?auto_15579 ) ( ON ?auto_15573 ?auto_15574 ) ( CLEAR ?auto_15573 ) ( not ( = ?auto_15572 ?auto_15574 ) ) ( not ( = ?auto_15573 ?auto_15574 ) ) ( not ( = ?auto_15571 ?auto_15574 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15572 ?auto_15573 )
      ( MAKE-2CRATE-VERIFY ?auto_15571 ?auto_15572 ?auto_15573 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15580 - SURFACE
      ?auto_15581 - SURFACE
    )
    :vars
    (
      ?auto_15588 - HOIST
      ?auto_15586 - PLACE
      ?auto_15584 - SURFACE
      ?auto_15587 - PLACE
      ?auto_15585 - HOIST
      ?auto_15582 - SURFACE
      ?auto_15583 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15588 ?auto_15586 ) ( SURFACE-AT ?auto_15580 ?auto_15586 ) ( CLEAR ?auto_15580 ) ( IS-CRATE ?auto_15581 ) ( not ( = ?auto_15580 ?auto_15581 ) ) ( AVAILABLE ?auto_15588 ) ( ON ?auto_15580 ?auto_15584 ) ( not ( = ?auto_15584 ?auto_15580 ) ) ( not ( = ?auto_15584 ?auto_15581 ) ) ( not ( = ?auto_15587 ?auto_15586 ) ) ( HOIST-AT ?auto_15585 ?auto_15587 ) ( not ( = ?auto_15588 ?auto_15585 ) ) ( AVAILABLE ?auto_15585 ) ( SURFACE-AT ?auto_15581 ?auto_15587 ) ( ON ?auto_15581 ?auto_15582 ) ( CLEAR ?auto_15581 ) ( not ( = ?auto_15580 ?auto_15582 ) ) ( not ( = ?auto_15581 ?auto_15582 ) ) ( not ( = ?auto_15584 ?auto_15582 ) ) ( TRUCK-AT ?auto_15583 ?auto_15586 ) )
    :subtasks
    ( ( !DRIVE ?auto_15583 ?auto_15586 ?auto_15587 )
      ( MAKE-2CRATE ?auto_15584 ?auto_15580 ?auto_15581 )
      ( MAKE-1CRATE-VERIFY ?auto_15580 ?auto_15581 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15589 - SURFACE
      ?auto_15590 - SURFACE
      ?auto_15591 - SURFACE
    )
    :vars
    (
      ?auto_15592 - HOIST
      ?auto_15595 - PLACE
      ?auto_15593 - PLACE
      ?auto_15597 - HOIST
      ?auto_15596 - SURFACE
      ?auto_15594 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15592 ?auto_15595 ) ( SURFACE-AT ?auto_15590 ?auto_15595 ) ( CLEAR ?auto_15590 ) ( IS-CRATE ?auto_15591 ) ( not ( = ?auto_15590 ?auto_15591 ) ) ( AVAILABLE ?auto_15592 ) ( ON ?auto_15590 ?auto_15589 ) ( not ( = ?auto_15589 ?auto_15590 ) ) ( not ( = ?auto_15589 ?auto_15591 ) ) ( not ( = ?auto_15593 ?auto_15595 ) ) ( HOIST-AT ?auto_15597 ?auto_15593 ) ( not ( = ?auto_15592 ?auto_15597 ) ) ( AVAILABLE ?auto_15597 ) ( SURFACE-AT ?auto_15591 ?auto_15593 ) ( ON ?auto_15591 ?auto_15596 ) ( CLEAR ?auto_15591 ) ( not ( = ?auto_15590 ?auto_15596 ) ) ( not ( = ?auto_15591 ?auto_15596 ) ) ( not ( = ?auto_15589 ?auto_15596 ) ) ( TRUCK-AT ?auto_15594 ?auto_15595 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15590 ?auto_15591 )
      ( MAKE-2CRATE-VERIFY ?auto_15589 ?auto_15590 ?auto_15591 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15598 - SURFACE
      ?auto_15599 - SURFACE
    )
    :vars
    (
      ?auto_15602 - HOIST
      ?auto_15601 - PLACE
      ?auto_15604 - SURFACE
      ?auto_15600 - PLACE
      ?auto_15605 - HOIST
      ?auto_15606 - SURFACE
      ?auto_15603 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15602 ?auto_15601 ) ( IS-CRATE ?auto_15599 ) ( not ( = ?auto_15598 ?auto_15599 ) ) ( not ( = ?auto_15604 ?auto_15598 ) ) ( not ( = ?auto_15604 ?auto_15599 ) ) ( not ( = ?auto_15600 ?auto_15601 ) ) ( HOIST-AT ?auto_15605 ?auto_15600 ) ( not ( = ?auto_15602 ?auto_15605 ) ) ( AVAILABLE ?auto_15605 ) ( SURFACE-AT ?auto_15599 ?auto_15600 ) ( ON ?auto_15599 ?auto_15606 ) ( CLEAR ?auto_15599 ) ( not ( = ?auto_15598 ?auto_15606 ) ) ( not ( = ?auto_15599 ?auto_15606 ) ) ( not ( = ?auto_15604 ?auto_15606 ) ) ( TRUCK-AT ?auto_15603 ?auto_15601 ) ( SURFACE-AT ?auto_15604 ?auto_15601 ) ( CLEAR ?auto_15604 ) ( LIFTING ?auto_15602 ?auto_15598 ) ( IS-CRATE ?auto_15598 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15604 ?auto_15598 )
      ( MAKE-2CRATE ?auto_15604 ?auto_15598 ?auto_15599 )
      ( MAKE-1CRATE-VERIFY ?auto_15598 ?auto_15599 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15607 - SURFACE
      ?auto_15608 - SURFACE
      ?auto_15609 - SURFACE
    )
    :vars
    (
      ?auto_15613 - HOIST
      ?auto_15614 - PLACE
      ?auto_15611 - PLACE
      ?auto_15610 - HOIST
      ?auto_15615 - SURFACE
      ?auto_15612 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15613 ?auto_15614 ) ( IS-CRATE ?auto_15609 ) ( not ( = ?auto_15608 ?auto_15609 ) ) ( not ( = ?auto_15607 ?auto_15608 ) ) ( not ( = ?auto_15607 ?auto_15609 ) ) ( not ( = ?auto_15611 ?auto_15614 ) ) ( HOIST-AT ?auto_15610 ?auto_15611 ) ( not ( = ?auto_15613 ?auto_15610 ) ) ( AVAILABLE ?auto_15610 ) ( SURFACE-AT ?auto_15609 ?auto_15611 ) ( ON ?auto_15609 ?auto_15615 ) ( CLEAR ?auto_15609 ) ( not ( = ?auto_15608 ?auto_15615 ) ) ( not ( = ?auto_15609 ?auto_15615 ) ) ( not ( = ?auto_15607 ?auto_15615 ) ) ( TRUCK-AT ?auto_15612 ?auto_15614 ) ( SURFACE-AT ?auto_15607 ?auto_15614 ) ( CLEAR ?auto_15607 ) ( LIFTING ?auto_15613 ?auto_15608 ) ( IS-CRATE ?auto_15608 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15608 ?auto_15609 )
      ( MAKE-2CRATE-VERIFY ?auto_15607 ?auto_15608 ?auto_15609 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15616 - SURFACE
      ?auto_15617 - SURFACE
    )
    :vars
    (
      ?auto_15621 - HOIST
      ?auto_15622 - PLACE
      ?auto_15623 - SURFACE
      ?auto_15620 - PLACE
      ?auto_15618 - HOIST
      ?auto_15619 - SURFACE
      ?auto_15624 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15621 ?auto_15622 ) ( IS-CRATE ?auto_15617 ) ( not ( = ?auto_15616 ?auto_15617 ) ) ( not ( = ?auto_15623 ?auto_15616 ) ) ( not ( = ?auto_15623 ?auto_15617 ) ) ( not ( = ?auto_15620 ?auto_15622 ) ) ( HOIST-AT ?auto_15618 ?auto_15620 ) ( not ( = ?auto_15621 ?auto_15618 ) ) ( AVAILABLE ?auto_15618 ) ( SURFACE-AT ?auto_15617 ?auto_15620 ) ( ON ?auto_15617 ?auto_15619 ) ( CLEAR ?auto_15617 ) ( not ( = ?auto_15616 ?auto_15619 ) ) ( not ( = ?auto_15617 ?auto_15619 ) ) ( not ( = ?auto_15623 ?auto_15619 ) ) ( TRUCK-AT ?auto_15624 ?auto_15622 ) ( SURFACE-AT ?auto_15623 ?auto_15622 ) ( CLEAR ?auto_15623 ) ( IS-CRATE ?auto_15616 ) ( AVAILABLE ?auto_15621 ) ( IN ?auto_15616 ?auto_15624 ) )
    :subtasks
    ( ( !UNLOAD ?auto_15621 ?auto_15616 ?auto_15624 ?auto_15622 )
      ( MAKE-2CRATE ?auto_15623 ?auto_15616 ?auto_15617 )
      ( MAKE-1CRATE-VERIFY ?auto_15616 ?auto_15617 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15625 - SURFACE
      ?auto_15626 - SURFACE
      ?auto_15627 - SURFACE
    )
    :vars
    (
      ?auto_15633 - HOIST
      ?auto_15631 - PLACE
      ?auto_15629 - PLACE
      ?auto_15630 - HOIST
      ?auto_15628 - SURFACE
      ?auto_15632 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15633 ?auto_15631 ) ( IS-CRATE ?auto_15627 ) ( not ( = ?auto_15626 ?auto_15627 ) ) ( not ( = ?auto_15625 ?auto_15626 ) ) ( not ( = ?auto_15625 ?auto_15627 ) ) ( not ( = ?auto_15629 ?auto_15631 ) ) ( HOIST-AT ?auto_15630 ?auto_15629 ) ( not ( = ?auto_15633 ?auto_15630 ) ) ( AVAILABLE ?auto_15630 ) ( SURFACE-AT ?auto_15627 ?auto_15629 ) ( ON ?auto_15627 ?auto_15628 ) ( CLEAR ?auto_15627 ) ( not ( = ?auto_15626 ?auto_15628 ) ) ( not ( = ?auto_15627 ?auto_15628 ) ) ( not ( = ?auto_15625 ?auto_15628 ) ) ( TRUCK-AT ?auto_15632 ?auto_15631 ) ( SURFACE-AT ?auto_15625 ?auto_15631 ) ( CLEAR ?auto_15625 ) ( IS-CRATE ?auto_15626 ) ( AVAILABLE ?auto_15633 ) ( IN ?auto_15626 ?auto_15632 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15626 ?auto_15627 )
      ( MAKE-2CRATE-VERIFY ?auto_15625 ?auto_15626 ?auto_15627 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15670 - SURFACE
      ?auto_15671 - SURFACE
    )
    :vars
    (
      ?auto_15675 - HOIST
      ?auto_15676 - PLACE
      ?auto_15672 - SURFACE
      ?auto_15673 - PLACE
      ?auto_15678 - HOIST
      ?auto_15677 - SURFACE
      ?auto_15674 - TRUCK
      ?auto_15679 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15675 ?auto_15676 ) ( SURFACE-AT ?auto_15670 ?auto_15676 ) ( CLEAR ?auto_15670 ) ( IS-CRATE ?auto_15671 ) ( not ( = ?auto_15670 ?auto_15671 ) ) ( AVAILABLE ?auto_15675 ) ( ON ?auto_15670 ?auto_15672 ) ( not ( = ?auto_15672 ?auto_15670 ) ) ( not ( = ?auto_15672 ?auto_15671 ) ) ( not ( = ?auto_15673 ?auto_15676 ) ) ( HOIST-AT ?auto_15678 ?auto_15673 ) ( not ( = ?auto_15675 ?auto_15678 ) ) ( AVAILABLE ?auto_15678 ) ( SURFACE-AT ?auto_15671 ?auto_15673 ) ( ON ?auto_15671 ?auto_15677 ) ( CLEAR ?auto_15671 ) ( not ( = ?auto_15670 ?auto_15677 ) ) ( not ( = ?auto_15671 ?auto_15677 ) ) ( not ( = ?auto_15672 ?auto_15677 ) ) ( TRUCK-AT ?auto_15674 ?auto_15679 ) ( not ( = ?auto_15679 ?auto_15676 ) ) ( not ( = ?auto_15673 ?auto_15679 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15674 ?auto_15679 ?auto_15676 )
      ( MAKE-1CRATE ?auto_15670 ?auto_15671 )
      ( MAKE-1CRATE-VERIFY ?auto_15670 ?auto_15671 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_15709 - SURFACE
      ?auto_15710 - SURFACE
      ?auto_15711 - SURFACE
      ?auto_15712 - SURFACE
    )
    :vars
    (
      ?auto_15713 - HOIST
      ?auto_15714 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15713 ?auto_15714 ) ( SURFACE-AT ?auto_15711 ?auto_15714 ) ( CLEAR ?auto_15711 ) ( LIFTING ?auto_15713 ?auto_15712 ) ( IS-CRATE ?auto_15712 ) ( not ( = ?auto_15711 ?auto_15712 ) ) ( ON ?auto_15710 ?auto_15709 ) ( ON ?auto_15711 ?auto_15710 ) ( not ( = ?auto_15709 ?auto_15710 ) ) ( not ( = ?auto_15709 ?auto_15711 ) ) ( not ( = ?auto_15709 ?auto_15712 ) ) ( not ( = ?auto_15710 ?auto_15711 ) ) ( not ( = ?auto_15710 ?auto_15712 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15711 ?auto_15712 )
      ( MAKE-3CRATE-VERIFY ?auto_15709 ?auto_15710 ?auto_15711 ?auto_15712 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_15726 - SURFACE
      ?auto_15727 - SURFACE
      ?auto_15728 - SURFACE
      ?auto_15729 - SURFACE
    )
    :vars
    (
      ?auto_15731 - HOIST
      ?auto_15732 - PLACE
      ?auto_15730 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15731 ?auto_15732 ) ( SURFACE-AT ?auto_15728 ?auto_15732 ) ( CLEAR ?auto_15728 ) ( IS-CRATE ?auto_15729 ) ( not ( = ?auto_15728 ?auto_15729 ) ) ( TRUCK-AT ?auto_15730 ?auto_15732 ) ( AVAILABLE ?auto_15731 ) ( IN ?auto_15729 ?auto_15730 ) ( ON ?auto_15728 ?auto_15727 ) ( not ( = ?auto_15727 ?auto_15728 ) ) ( not ( = ?auto_15727 ?auto_15729 ) ) ( ON ?auto_15727 ?auto_15726 ) ( not ( = ?auto_15726 ?auto_15727 ) ) ( not ( = ?auto_15726 ?auto_15728 ) ) ( not ( = ?auto_15726 ?auto_15729 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15727 ?auto_15728 ?auto_15729 )
      ( MAKE-3CRATE-VERIFY ?auto_15726 ?auto_15727 ?auto_15728 ?auto_15729 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_15747 - SURFACE
      ?auto_15748 - SURFACE
      ?auto_15749 - SURFACE
      ?auto_15750 - SURFACE
    )
    :vars
    (
      ?auto_15754 - HOIST
      ?auto_15751 - PLACE
      ?auto_15753 - TRUCK
      ?auto_15752 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15754 ?auto_15751 ) ( SURFACE-AT ?auto_15749 ?auto_15751 ) ( CLEAR ?auto_15749 ) ( IS-CRATE ?auto_15750 ) ( not ( = ?auto_15749 ?auto_15750 ) ) ( AVAILABLE ?auto_15754 ) ( IN ?auto_15750 ?auto_15753 ) ( ON ?auto_15749 ?auto_15748 ) ( not ( = ?auto_15748 ?auto_15749 ) ) ( not ( = ?auto_15748 ?auto_15750 ) ) ( TRUCK-AT ?auto_15753 ?auto_15752 ) ( not ( = ?auto_15752 ?auto_15751 ) ) ( ON ?auto_15748 ?auto_15747 ) ( not ( = ?auto_15747 ?auto_15748 ) ) ( not ( = ?auto_15747 ?auto_15749 ) ) ( not ( = ?auto_15747 ?auto_15750 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15748 ?auto_15749 ?auto_15750 )
      ( MAKE-3CRATE-VERIFY ?auto_15747 ?auto_15748 ?auto_15749 ?auto_15750 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_15771 - SURFACE
      ?auto_15772 - SURFACE
      ?auto_15773 - SURFACE
      ?auto_15774 - SURFACE
    )
    :vars
    (
      ?auto_15775 - HOIST
      ?auto_15779 - PLACE
      ?auto_15776 - TRUCK
      ?auto_15778 - PLACE
      ?auto_15777 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_15775 ?auto_15779 ) ( SURFACE-AT ?auto_15773 ?auto_15779 ) ( CLEAR ?auto_15773 ) ( IS-CRATE ?auto_15774 ) ( not ( = ?auto_15773 ?auto_15774 ) ) ( AVAILABLE ?auto_15775 ) ( ON ?auto_15773 ?auto_15772 ) ( not ( = ?auto_15772 ?auto_15773 ) ) ( not ( = ?auto_15772 ?auto_15774 ) ) ( TRUCK-AT ?auto_15776 ?auto_15778 ) ( not ( = ?auto_15778 ?auto_15779 ) ) ( HOIST-AT ?auto_15777 ?auto_15778 ) ( LIFTING ?auto_15777 ?auto_15774 ) ( not ( = ?auto_15775 ?auto_15777 ) ) ( ON ?auto_15772 ?auto_15771 ) ( not ( = ?auto_15771 ?auto_15772 ) ) ( not ( = ?auto_15771 ?auto_15773 ) ) ( not ( = ?auto_15771 ?auto_15774 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15772 ?auto_15773 ?auto_15774 )
      ( MAKE-3CRATE-VERIFY ?auto_15771 ?auto_15772 ?auto_15773 ?auto_15774 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_15798 - SURFACE
      ?auto_15799 - SURFACE
      ?auto_15800 - SURFACE
      ?auto_15801 - SURFACE
    )
    :vars
    (
      ?auto_15806 - HOIST
      ?auto_15803 - PLACE
      ?auto_15805 - TRUCK
      ?auto_15807 - PLACE
      ?auto_15804 - HOIST
      ?auto_15802 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_15806 ?auto_15803 ) ( SURFACE-AT ?auto_15800 ?auto_15803 ) ( CLEAR ?auto_15800 ) ( IS-CRATE ?auto_15801 ) ( not ( = ?auto_15800 ?auto_15801 ) ) ( AVAILABLE ?auto_15806 ) ( ON ?auto_15800 ?auto_15799 ) ( not ( = ?auto_15799 ?auto_15800 ) ) ( not ( = ?auto_15799 ?auto_15801 ) ) ( TRUCK-AT ?auto_15805 ?auto_15807 ) ( not ( = ?auto_15807 ?auto_15803 ) ) ( HOIST-AT ?auto_15804 ?auto_15807 ) ( not ( = ?auto_15806 ?auto_15804 ) ) ( AVAILABLE ?auto_15804 ) ( SURFACE-AT ?auto_15801 ?auto_15807 ) ( ON ?auto_15801 ?auto_15802 ) ( CLEAR ?auto_15801 ) ( not ( = ?auto_15800 ?auto_15802 ) ) ( not ( = ?auto_15801 ?auto_15802 ) ) ( not ( = ?auto_15799 ?auto_15802 ) ) ( ON ?auto_15799 ?auto_15798 ) ( not ( = ?auto_15798 ?auto_15799 ) ) ( not ( = ?auto_15798 ?auto_15800 ) ) ( not ( = ?auto_15798 ?auto_15801 ) ) ( not ( = ?auto_15798 ?auto_15802 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15799 ?auto_15800 ?auto_15801 )
      ( MAKE-3CRATE-VERIFY ?auto_15798 ?auto_15799 ?auto_15800 ?auto_15801 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_15826 - SURFACE
      ?auto_15827 - SURFACE
      ?auto_15828 - SURFACE
      ?auto_15829 - SURFACE
    )
    :vars
    (
      ?auto_15833 - HOIST
      ?auto_15830 - PLACE
      ?auto_15831 - PLACE
      ?auto_15834 - HOIST
      ?auto_15835 - SURFACE
      ?auto_15832 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15833 ?auto_15830 ) ( SURFACE-AT ?auto_15828 ?auto_15830 ) ( CLEAR ?auto_15828 ) ( IS-CRATE ?auto_15829 ) ( not ( = ?auto_15828 ?auto_15829 ) ) ( AVAILABLE ?auto_15833 ) ( ON ?auto_15828 ?auto_15827 ) ( not ( = ?auto_15827 ?auto_15828 ) ) ( not ( = ?auto_15827 ?auto_15829 ) ) ( not ( = ?auto_15831 ?auto_15830 ) ) ( HOIST-AT ?auto_15834 ?auto_15831 ) ( not ( = ?auto_15833 ?auto_15834 ) ) ( AVAILABLE ?auto_15834 ) ( SURFACE-AT ?auto_15829 ?auto_15831 ) ( ON ?auto_15829 ?auto_15835 ) ( CLEAR ?auto_15829 ) ( not ( = ?auto_15828 ?auto_15835 ) ) ( not ( = ?auto_15829 ?auto_15835 ) ) ( not ( = ?auto_15827 ?auto_15835 ) ) ( TRUCK-AT ?auto_15832 ?auto_15830 ) ( ON ?auto_15827 ?auto_15826 ) ( not ( = ?auto_15826 ?auto_15827 ) ) ( not ( = ?auto_15826 ?auto_15828 ) ) ( not ( = ?auto_15826 ?auto_15829 ) ) ( not ( = ?auto_15826 ?auto_15835 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15827 ?auto_15828 ?auto_15829 )
      ( MAKE-3CRATE-VERIFY ?auto_15826 ?auto_15827 ?auto_15828 ?auto_15829 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_15854 - SURFACE
      ?auto_15855 - SURFACE
      ?auto_15856 - SURFACE
      ?auto_15857 - SURFACE
    )
    :vars
    (
      ?auto_15862 - HOIST
      ?auto_15860 - PLACE
      ?auto_15861 - PLACE
      ?auto_15863 - HOIST
      ?auto_15859 - SURFACE
      ?auto_15858 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15862 ?auto_15860 ) ( IS-CRATE ?auto_15857 ) ( not ( = ?auto_15856 ?auto_15857 ) ) ( not ( = ?auto_15855 ?auto_15856 ) ) ( not ( = ?auto_15855 ?auto_15857 ) ) ( not ( = ?auto_15861 ?auto_15860 ) ) ( HOIST-AT ?auto_15863 ?auto_15861 ) ( not ( = ?auto_15862 ?auto_15863 ) ) ( AVAILABLE ?auto_15863 ) ( SURFACE-AT ?auto_15857 ?auto_15861 ) ( ON ?auto_15857 ?auto_15859 ) ( CLEAR ?auto_15857 ) ( not ( = ?auto_15856 ?auto_15859 ) ) ( not ( = ?auto_15857 ?auto_15859 ) ) ( not ( = ?auto_15855 ?auto_15859 ) ) ( TRUCK-AT ?auto_15858 ?auto_15860 ) ( SURFACE-AT ?auto_15855 ?auto_15860 ) ( CLEAR ?auto_15855 ) ( LIFTING ?auto_15862 ?auto_15856 ) ( IS-CRATE ?auto_15856 ) ( ON ?auto_15855 ?auto_15854 ) ( not ( = ?auto_15854 ?auto_15855 ) ) ( not ( = ?auto_15854 ?auto_15856 ) ) ( not ( = ?auto_15854 ?auto_15857 ) ) ( not ( = ?auto_15854 ?auto_15859 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15855 ?auto_15856 ?auto_15857 )
      ( MAKE-3CRATE-VERIFY ?auto_15854 ?auto_15855 ?auto_15856 ?auto_15857 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_15882 - SURFACE
      ?auto_15883 - SURFACE
      ?auto_15884 - SURFACE
      ?auto_15885 - SURFACE
    )
    :vars
    (
      ?auto_15891 - HOIST
      ?auto_15889 - PLACE
      ?auto_15887 - PLACE
      ?auto_15886 - HOIST
      ?auto_15890 - SURFACE
      ?auto_15888 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15891 ?auto_15889 ) ( IS-CRATE ?auto_15885 ) ( not ( = ?auto_15884 ?auto_15885 ) ) ( not ( = ?auto_15883 ?auto_15884 ) ) ( not ( = ?auto_15883 ?auto_15885 ) ) ( not ( = ?auto_15887 ?auto_15889 ) ) ( HOIST-AT ?auto_15886 ?auto_15887 ) ( not ( = ?auto_15891 ?auto_15886 ) ) ( AVAILABLE ?auto_15886 ) ( SURFACE-AT ?auto_15885 ?auto_15887 ) ( ON ?auto_15885 ?auto_15890 ) ( CLEAR ?auto_15885 ) ( not ( = ?auto_15884 ?auto_15890 ) ) ( not ( = ?auto_15885 ?auto_15890 ) ) ( not ( = ?auto_15883 ?auto_15890 ) ) ( TRUCK-AT ?auto_15888 ?auto_15889 ) ( SURFACE-AT ?auto_15883 ?auto_15889 ) ( CLEAR ?auto_15883 ) ( IS-CRATE ?auto_15884 ) ( AVAILABLE ?auto_15891 ) ( IN ?auto_15884 ?auto_15888 ) ( ON ?auto_15883 ?auto_15882 ) ( not ( = ?auto_15882 ?auto_15883 ) ) ( not ( = ?auto_15882 ?auto_15884 ) ) ( not ( = ?auto_15882 ?auto_15885 ) ) ( not ( = ?auto_15882 ?auto_15890 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15883 ?auto_15884 ?auto_15885 )
      ( MAKE-3CRATE-VERIFY ?auto_15882 ?auto_15883 ?auto_15884 ?auto_15885 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_16173 - SURFACE
      ?auto_16174 - SURFACE
      ?auto_16175 - SURFACE
      ?auto_16177 - SURFACE
      ?auto_16176 - SURFACE
    )
    :vars
    (
      ?auto_16179 - HOIST
      ?auto_16178 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16179 ?auto_16178 ) ( SURFACE-AT ?auto_16177 ?auto_16178 ) ( CLEAR ?auto_16177 ) ( LIFTING ?auto_16179 ?auto_16176 ) ( IS-CRATE ?auto_16176 ) ( not ( = ?auto_16177 ?auto_16176 ) ) ( ON ?auto_16174 ?auto_16173 ) ( ON ?auto_16175 ?auto_16174 ) ( ON ?auto_16177 ?auto_16175 ) ( not ( = ?auto_16173 ?auto_16174 ) ) ( not ( = ?auto_16173 ?auto_16175 ) ) ( not ( = ?auto_16173 ?auto_16177 ) ) ( not ( = ?auto_16173 ?auto_16176 ) ) ( not ( = ?auto_16174 ?auto_16175 ) ) ( not ( = ?auto_16174 ?auto_16177 ) ) ( not ( = ?auto_16174 ?auto_16176 ) ) ( not ( = ?auto_16175 ?auto_16177 ) ) ( not ( = ?auto_16175 ?auto_16176 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16177 ?auto_16176 )
      ( MAKE-4CRATE-VERIFY ?auto_16173 ?auto_16174 ?auto_16175 ?auto_16177 ?auto_16176 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_16198 - SURFACE
      ?auto_16199 - SURFACE
      ?auto_16200 - SURFACE
      ?auto_16202 - SURFACE
      ?auto_16201 - SURFACE
    )
    :vars
    (
      ?auto_16205 - HOIST
      ?auto_16204 - PLACE
      ?auto_16203 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16205 ?auto_16204 ) ( SURFACE-AT ?auto_16202 ?auto_16204 ) ( CLEAR ?auto_16202 ) ( IS-CRATE ?auto_16201 ) ( not ( = ?auto_16202 ?auto_16201 ) ) ( TRUCK-AT ?auto_16203 ?auto_16204 ) ( AVAILABLE ?auto_16205 ) ( IN ?auto_16201 ?auto_16203 ) ( ON ?auto_16202 ?auto_16200 ) ( not ( = ?auto_16200 ?auto_16202 ) ) ( not ( = ?auto_16200 ?auto_16201 ) ) ( ON ?auto_16199 ?auto_16198 ) ( ON ?auto_16200 ?auto_16199 ) ( not ( = ?auto_16198 ?auto_16199 ) ) ( not ( = ?auto_16198 ?auto_16200 ) ) ( not ( = ?auto_16198 ?auto_16202 ) ) ( not ( = ?auto_16198 ?auto_16201 ) ) ( not ( = ?auto_16199 ?auto_16200 ) ) ( not ( = ?auto_16199 ?auto_16202 ) ) ( not ( = ?auto_16199 ?auto_16201 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16200 ?auto_16202 ?auto_16201 )
      ( MAKE-4CRATE-VERIFY ?auto_16198 ?auto_16199 ?auto_16200 ?auto_16202 ?auto_16201 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_16228 - SURFACE
      ?auto_16229 - SURFACE
      ?auto_16230 - SURFACE
      ?auto_16232 - SURFACE
      ?auto_16231 - SURFACE
    )
    :vars
    (
      ?auto_16235 - HOIST
      ?auto_16236 - PLACE
      ?auto_16234 - TRUCK
      ?auto_16233 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16235 ?auto_16236 ) ( SURFACE-AT ?auto_16232 ?auto_16236 ) ( CLEAR ?auto_16232 ) ( IS-CRATE ?auto_16231 ) ( not ( = ?auto_16232 ?auto_16231 ) ) ( AVAILABLE ?auto_16235 ) ( IN ?auto_16231 ?auto_16234 ) ( ON ?auto_16232 ?auto_16230 ) ( not ( = ?auto_16230 ?auto_16232 ) ) ( not ( = ?auto_16230 ?auto_16231 ) ) ( TRUCK-AT ?auto_16234 ?auto_16233 ) ( not ( = ?auto_16233 ?auto_16236 ) ) ( ON ?auto_16229 ?auto_16228 ) ( ON ?auto_16230 ?auto_16229 ) ( not ( = ?auto_16228 ?auto_16229 ) ) ( not ( = ?auto_16228 ?auto_16230 ) ) ( not ( = ?auto_16228 ?auto_16232 ) ) ( not ( = ?auto_16228 ?auto_16231 ) ) ( not ( = ?auto_16229 ?auto_16230 ) ) ( not ( = ?auto_16229 ?auto_16232 ) ) ( not ( = ?auto_16229 ?auto_16231 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16230 ?auto_16232 ?auto_16231 )
      ( MAKE-4CRATE-VERIFY ?auto_16228 ?auto_16229 ?auto_16230 ?auto_16232 ?auto_16231 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_16262 - SURFACE
      ?auto_16263 - SURFACE
      ?auto_16264 - SURFACE
      ?auto_16266 - SURFACE
      ?auto_16265 - SURFACE
    )
    :vars
    (
      ?auto_16270 - HOIST
      ?auto_16271 - PLACE
      ?auto_16268 - TRUCK
      ?auto_16267 - PLACE
      ?auto_16269 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_16270 ?auto_16271 ) ( SURFACE-AT ?auto_16266 ?auto_16271 ) ( CLEAR ?auto_16266 ) ( IS-CRATE ?auto_16265 ) ( not ( = ?auto_16266 ?auto_16265 ) ) ( AVAILABLE ?auto_16270 ) ( ON ?auto_16266 ?auto_16264 ) ( not ( = ?auto_16264 ?auto_16266 ) ) ( not ( = ?auto_16264 ?auto_16265 ) ) ( TRUCK-AT ?auto_16268 ?auto_16267 ) ( not ( = ?auto_16267 ?auto_16271 ) ) ( HOIST-AT ?auto_16269 ?auto_16267 ) ( LIFTING ?auto_16269 ?auto_16265 ) ( not ( = ?auto_16270 ?auto_16269 ) ) ( ON ?auto_16263 ?auto_16262 ) ( ON ?auto_16264 ?auto_16263 ) ( not ( = ?auto_16262 ?auto_16263 ) ) ( not ( = ?auto_16262 ?auto_16264 ) ) ( not ( = ?auto_16262 ?auto_16266 ) ) ( not ( = ?auto_16262 ?auto_16265 ) ) ( not ( = ?auto_16263 ?auto_16264 ) ) ( not ( = ?auto_16263 ?auto_16266 ) ) ( not ( = ?auto_16263 ?auto_16265 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16264 ?auto_16266 ?auto_16265 )
      ( MAKE-4CRATE-VERIFY ?auto_16262 ?auto_16263 ?auto_16264 ?auto_16266 ?auto_16265 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_16300 - SURFACE
      ?auto_16301 - SURFACE
      ?auto_16302 - SURFACE
      ?auto_16304 - SURFACE
      ?auto_16303 - SURFACE
    )
    :vars
    (
      ?auto_16309 - HOIST
      ?auto_16308 - PLACE
      ?auto_16310 - TRUCK
      ?auto_16305 - PLACE
      ?auto_16306 - HOIST
      ?auto_16307 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16309 ?auto_16308 ) ( SURFACE-AT ?auto_16304 ?auto_16308 ) ( CLEAR ?auto_16304 ) ( IS-CRATE ?auto_16303 ) ( not ( = ?auto_16304 ?auto_16303 ) ) ( AVAILABLE ?auto_16309 ) ( ON ?auto_16304 ?auto_16302 ) ( not ( = ?auto_16302 ?auto_16304 ) ) ( not ( = ?auto_16302 ?auto_16303 ) ) ( TRUCK-AT ?auto_16310 ?auto_16305 ) ( not ( = ?auto_16305 ?auto_16308 ) ) ( HOIST-AT ?auto_16306 ?auto_16305 ) ( not ( = ?auto_16309 ?auto_16306 ) ) ( AVAILABLE ?auto_16306 ) ( SURFACE-AT ?auto_16303 ?auto_16305 ) ( ON ?auto_16303 ?auto_16307 ) ( CLEAR ?auto_16303 ) ( not ( = ?auto_16304 ?auto_16307 ) ) ( not ( = ?auto_16303 ?auto_16307 ) ) ( not ( = ?auto_16302 ?auto_16307 ) ) ( ON ?auto_16301 ?auto_16300 ) ( ON ?auto_16302 ?auto_16301 ) ( not ( = ?auto_16300 ?auto_16301 ) ) ( not ( = ?auto_16300 ?auto_16302 ) ) ( not ( = ?auto_16300 ?auto_16304 ) ) ( not ( = ?auto_16300 ?auto_16303 ) ) ( not ( = ?auto_16300 ?auto_16307 ) ) ( not ( = ?auto_16301 ?auto_16302 ) ) ( not ( = ?auto_16301 ?auto_16304 ) ) ( not ( = ?auto_16301 ?auto_16303 ) ) ( not ( = ?auto_16301 ?auto_16307 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16302 ?auto_16304 ?auto_16303 )
      ( MAKE-4CRATE-VERIFY ?auto_16300 ?auto_16301 ?auto_16302 ?auto_16304 ?auto_16303 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_16339 - SURFACE
      ?auto_16340 - SURFACE
      ?auto_16341 - SURFACE
      ?auto_16343 - SURFACE
      ?auto_16342 - SURFACE
    )
    :vars
    (
      ?auto_16344 - HOIST
      ?auto_16348 - PLACE
      ?auto_16347 - PLACE
      ?auto_16346 - HOIST
      ?auto_16345 - SURFACE
      ?auto_16349 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16344 ?auto_16348 ) ( SURFACE-AT ?auto_16343 ?auto_16348 ) ( CLEAR ?auto_16343 ) ( IS-CRATE ?auto_16342 ) ( not ( = ?auto_16343 ?auto_16342 ) ) ( AVAILABLE ?auto_16344 ) ( ON ?auto_16343 ?auto_16341 ) ( not ( = ?auto_16341 ?auto_16343 ) ) ( not ( = ?auto_16341 ?auto_16342 ) ) ( not ( = ?auto_16347 ?auto_16348 ) ) ( HOIST-AT ?auto_16346 ?auto_16347 ) ( not ( = ?auto_16344 ?auto_16346 ) ) ( AVAILABLE ?auto_16346 ) ( SURFACE-AT ?auto_16342 ?auto_16347 ) ( ON ?auto_16342 ?auto_16345 ) ( CLEAR ?auto_16342 ) ( not ( = ?auto_16343 ?auto_16345 ) ) ( not ( = ?auto_16342 ?auto_16345 ) ) ( not ( = ?auto_16341 ?auto_16345 ) ) ( TRUCK-AT ?auto_16349 ?auto_16348 ) ( ON ?auto_16340 ?auto_16339 ) ( ON ?auto_16341 ?auto_16340 ) ( not ( = ?auto_16339 ?auto_16340 ) ) ( not ( = ?auto_16339 ?auto_16341 ) ) ( not ( = ?auto_16339 ?auto_16343 ) ) ( not ( = ?auto_16339 ?auto_16342 ) ) ( not ( = ?auto_16339 ?auto_16345 ) ) ( not ( = ?auto_16340 ?auto_16341 ) ) ( not ( = ?auto_16340 ?auto_16343 ) ) ( not ( = ?auto_16340 ?auto_16342 ) ) ( not ( = ?auto_16340 ?auto_16345 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16341 ?auto_16343 ?auto_16342 )
      ( MAKE-4CRATE-VERIFY ?auto_16339 ?auto_16340 ?auto_16341 ?auto_16343 ?auto_16342 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_16378 - SURFACE
      ?auto_16379 - SURFACE
      ?auto_16380 - SURFACE
      ?auto_16382 - SURFACE
      ?auto_16381 - SURFACE
    )
    :vars
    (
      ?auto_16387 - HOIST
      ?auto_16386 - PLACE
      ?auto_16388 - PLACE
      ?auto_16385 - HOIST
      ?auto_16384 - SURFACE
      ?auto_16383 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16387 ?auto_16386 ) ( IS-CRATE ?auto_16381 ) ( not ( = ?auto_16382 ?auto_16381 ) ) ( not ( = ?auto_16380 ?auto_16382 ) ) ( not ( = ?auto_16380 ?auto_16381 ) ) ( not ( = ?auto_16388 ?auto_16386 ) ) ( HOIST-AT ?auto_16385 ?auto_16388 ) ( not ( = ?auto_16387 ?auto_16385 ) ) ( AVAILABLE ?auto_16385 ) ( SURFACE-AT ?auto_16381 ?auto_16388 ) ( ON ?auto_16381 ?auto_16384 ) ( CLEAR ?auto_16381 ) ( not ( = ?auto_16382 ?auto_16384 ) ) ( not ( = ?auto_16381 ?auto_16384 ) ) ( not ( = ?auto_16380 ?auto_16384 ) ) ( TRUCK-AT ?auto_16383 ?auto_16386 ) ( SURFACE-AT ?auto_16380 ?auto_16386 ) ( CLEAR ?auto_16380 ) ( LIFTING ?auto_16387 ?auto_16382 ) ( IS-CRATE ?auto_16382 ) ( ON ?auto_16379 ?auto_16378 ) ( ON ?auto_16380 ?auto_16379 ) ( not ( = ?auto_16378 ?auto_16379 ) ) ( not ( = ?auto_16378 ?auto_16380 ) ) ( not ( = ?auto_16378 ?auto_16382 ) ) ( not ( = ?auto_16378 ?auto_16381 ) ) ( not ( = ?auto_16378 ?auto_16384 ) ) ( not ( = ?auto_16379 ?auto_16380 ) ) ( not ( = ?auto_16379 ?auto_16382 ) ) ( not ( = ?auto_16379 ?auto_16381 ) ) ( not ( = ?auto_16379 ?auto_16384 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16380 ?auto_16382 ?auto_16381 )
      ( MAKE-4CRATE-VERIFY ?auto_16378 ?auto_16379 ?auto_16380 ?auto_16382 ?auto_16381 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_16417 - SURFACE
      ?auto_16418 - SURFACE
      ?auto_16419 - SURFACE
      ?auto_16421 - SURFACE
      ?auto_16420 - SURFACE
    )
    :vars
    (
      ?auto_16423 - HOIST
      ?auto_16422 - PLACE
      ?auto_16425 - PLACE
      ?auto_16426 - HOIST
      ?auto_16424 - SURFACE
      ?auto_16427 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16423 ?auto_16422 ) ( IS-CRATE ?auto_16420 ) ( not ( = ?auto_16421 ?auto_16420 ) ) ( not ( = ?auto_16419 ?auto_16421 ) ) ( not ( = ?auto_16419 ?auto_16420 ) ) ( not ( = ?auto_16425 ?auto_16422 ) ) ( HOIST-AT ?auto_16426 ?auto_16425 ) ( not ( = ?auto_16423 ?auto_16426 ) ) ( AVAILABLE ?auto_16426 ) ( SURFACE-AT ?auto_16420 ?auto_16425 ) ( ON ?auto_16420 ?auto_16424 ) ( CLEAR ?auto_16420 ) ( not ( = ?auto_16421 ?auto_16424 ) ) ( not ( = ?auto_16420 ?auto_16424 ) ) ( not ( = ?auto_16419 ?auto_16424 ) ) ( TRUCK-AT ?auto_16427 ?auto_16422 ) ( SURFACE-AT ?auto_16419 ?auto_16422 ) ( CLEAR ?auto_16419 ) ( IS-CRATE ?auto_16421 ) ( AVAILABLE ?auto_16423 ) ( IN ?auto_16421 ?auto_16427 ) ( ON ?auto_16418 ?auto_16417 ) ( ON ?auto_16419 ?auto_16418 ) ( not ( = ?auto_16417 ?auto_16418 ) ) ( not ( = ?auto_16417 ?auto_16419 ) ) ( not ( = ?auto_16417 ?auto_16421 ) ) ( not ( = ?auto_16417 ?auto_16420 ) ) ( not ( = ?auto_16417 ?auto_16424 ) ) ( not ( = ?auto_16418 ?auto_16419 ) ) ( not ( = ?auto_16418 ?auto_16421 ) ) ( not ( = ?auto_16418 ?auto_16420 ) ) ( not ( = ?auto_16418 ?auto_16424 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16419 ?auto_16421 ?auto_16420 )
      ( MAKE-4CRATE-VERIFY ?auto_16417 ?auto_16418 ?auto_16419 ?auto_16421 ?auto_16420 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16690 - SURFACE
      ?auto_16691 - SURFACE
    )
    :vars
    (
      ?auto_16697 - HOIST
      ?auto_16694 - PLACE
      ?auto_16696 - SURFACE
      ?auto_16693 - TRUCK
      ?auto_16695 - PLACE
      ?auto_16692 - HOIST
      ?auto_16698 - SURFACE
      ?auto_16699 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_16697 ?auto_16694 ) ( SURFACE-AT ?auto_16690 ?auto_16694 ) ( CLEAR ?auto_16690 ) ( IS-CRATE ?auto_16691 ) ( not ( = ?auto_16690 ?auto_16691 ) ) ( AVAILABLE ?auto_16697 ) ( ON ?auto_16690 ?auto_16696 ) ( not ( = ?auto_16696 ?auto_16690 ) ) ( not ( = ?auto_16696 ?auto_16691 ) ) ( TRUCK-AT ?auto_16693 ?auto_16695 ) ( not ( = ?auto_16695 ?auto_16694 ) ) ( HOIST-AT ?auto_16692 ?auto_16695 ) ( not ( = ?auto_16697 ?auto_16692 ) ) ( SURFACE-AT ?auto_16691 ?auto_16695 ) ( ON ?auto_16691 ?auto_16698 ) ( CLEAR ?auto_16691 ) ( not ( = ?auto_16690 ?auto_16698 ) ) ( not ( = ?auto_16691 ?auto_16698 ) ) ( not ( = ?auto_16696 ?auto_16698 ) ) ( LIFTING ?auto_16692 ?auto_16699 ) ( IS-CRATE ?auto_16699 ) ( not ( = ?auto_16690 ?auto_16699 ) ) ( not ( = ?auto_16691 ?auto_16699 ) ) ( not ( = ?auto_16696 ?auto_16699 ) ) ( not ( = ?auto_16698 ?auto_16699 ) ) )
    :subtasks
    ( ( !LOAD ?auto_16692 ?auto_16699 ?auto_16693 ?auto_16695 )
      ( MAKE-1CRATE ?auto_16690 ?auto_16691 )
      ( MAKE-1CRATE-VERIFY ?auto_16690 ?auto_16691 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_17076 - SURFACE
      ?auto_17077 - SURFACE
      ?auto_17078 - SURFACE
      ?auto_17080 - SURFACE
      ?auto_17079 - SURFACE
      ?auto_17081 - SURFACE
    )
    :vars
    (
      ?auto_17083 - HOIST
      ?auto_17082 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17083 ?auto_17082 ) ( SURFACE-AT ?auto_17079 ?auto_17082 ) ( CLEAR ?auto_17079 ) ( LIFTING ?auto_17083 ?auto_17081 ) ( IS-CRATE ?auto_17081 ) ( not ( = ?auto_17079 ?auto_17081 ) ) ( ON ?auto_17077 ?auto_17076 ) ( ON ?auto_17078 ?auto_17077 ) ( ON ?auto_17080 ?auto_17078 ) ( ON ?auto_17079 ?auto_17080 ) ( not ( = ?auto_17076 ?auto_17077 ) ) ( not ( = ?auto_17076 ?auto_17078 ) ) ( not ( = ?auto_17076 ?auto_17080 ) ) ( not ( = ?auto_17076 ?auto_17079 ) ) ( not ( = ?auto_17076 ?auto_17081 ) ) ( not ( = ?auto_17077 ?auto_17078 ) ) ( not ( = ?auto_17077 ?auto_17080 ) ) ( not ( = ?auto_17077 ?auto_17079 ) ) ( not ( = ?auto_17077 ?auto_17081 ) ) ( not ( = ?auto_17078 ?auto_17080 ) ) ( not ( = ?auto_17078 ?auto_17079 ) ) ( not ( = ?auto_17078 ?auto_17081 ) ) ( not ( = ?auto_17080 ?auto_17079 ) ) ( not ( = ?auto_17080 ?auto_17081 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_17079 ?auto_17081 )
      ( MAKE-5CRATE-VERIFY ?auto_17076 ?auto_17077 ?auto_17078 ?auto_17080 ?auto_17079 ?auto_17081 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_17110 - SURFACE
      ?auto_17111 - SURFACE
      ?auto_17112 - SURFACE
      ?auto_17114 - SURFACE
      ?auto_17113 - SURFACE
      ?auto_17115 - SURFACE
    )
    :vars
    (
      ?auto_17116 - HOIST
      ?auto_17118 - PLACE
      ?auto_17117 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17116 ?auto_17118 ) ( SURFACE-AT ?auto_17113 ?auto_17118 ) ( CLEAR ?auto_17113 ) ( IS-CRATE ?auto_17115 ) ( not ( = ?auto_17113 ?auto_17115 ) ) ( TRUCK-AT ?auto_17117 ?auto_17118 ) ( AVAILABLE ?auto_17116 ) ( IN ?auto_17115 ?auto_17117 ) ( ON ?auto_17113 ?auto_17114 ) ( not ( = ?auto_17114 ?auto_17113 ) ) ( not ( = ?auto_17114 ?auto_17115 ) ) ( ON ?auto_17111 ?auto_17110 ) ( ON ?auto_17112 ?auto_17111 ) ( ON ?auto_17114 ?auto_17112 ) ( not ( = ?auto_17110 ?auto_17111 ) ) ( not ( = ?auto_17110 ?auto_17112 ) ) ( not ( = ?auto_17110 ?auto_17114 ) ) ( not ( = ?auto_17110 ?auto_17113 ) ) ( not ( = ?auto_17110 ?auto_17115 ) ) ( not ( = ?auto_17111 ?auto_17112 ) ) ( not ( = ?auto_17111 ?auto_17114 ) ) ( not ( = ?auto_17111 ?auto_17113 ) ) ( not ( = ?auto_17111 ?auto_17115 ) ) ( not ( = ?auto_17112 ?auto_17114 ) ) ( not ( = ?auto_17112 ?auto_17113 ) ) ( not ( = ?auto_17112 ?auto_17115 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17114 ?auto_17113 ?auto_17115 )
      ( MAKE-5CRATE-VERIFY ?auto_17110 ?auto_17111 ?auto_17112 ?auto_17114 ?auto_17113 ?auto_17115 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_17150 - SURFACE
      ?auto_17151 - SURFACE
      ?auto_17152 - SURFACE
      ?auto_17154 - SURFACE
      ?auto_17153 - SURFACE
      ?auto_17155 - SURFACE
    )
    :vars
    (
      ?auto_17157 - HOIST
      ?auto_17158 - PLACE
      ?auto_17159 - TRUCK
      ?auto_17156 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17157 ?auto_17158 ) ( SURFACE-AT ?auto_17153 ?auto_17158 ) ( CLEAR ?auto_17153 ) ( IS-CRATE ?auto_17155 ) ( not ( = ?auto_17153 ?auto_17155 ) ) ( AVAILABLE ?auto_17157 ) ( IN ?auto_17155 ?auto_17159 ) ( ON ?auto_17153 ?auto_17154 ) ( not ( = ?auto_17154 ?auto_17153 ) ) ( not ( = ?auto_17154 ?auto_17155 ) ) ( TRUCK-AT ?auto_17159 ?auto_17156 ) ( not ( = ?auto_17156 ?auto_17158 ) ) ( ON ?auto_17151 ?auto_17150 ) ( ON ?auto_17152 ?auto_17151 ) ( ON ?auto_17154 ?auto_17152 ) ( not ( = ?auto_17150 ?auto_17151 ) ) ( not ( = ?auto_17150 ?auto_17152 ) ) ( not ( = ?auto_17150 ?auto_17154 ) ) ( not ( = ?auto_17150 ?auto_17153 ) ) ( not ( = ?auto_17150 ?auto_17155 ) ) ( not ( = ?auto_17151 ?auto_17152 ) ) ( not ( = ?auto_17151 ?auto_17154 ) ) ( not ( = ?auto_17151 ?auto_17153 ) ) ( not ( = ?auto_17151 ?auto_17155 ) ) ( not ( = ?auto_17152 ?auto_17154 ) ) ( not ( = ?auto_17152 ?auto_17153 ) ) ( not ( = ?auto_17152 ?auto_17155 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17154 ?auto_17153 ?auto_17155 )
      ( MAKE-5CRATE-VERIFY ?auto_17150 ?auto_17151 ?auto_17152 ?auto_17154 ?auto_17153 ?auto_17155 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_17195 - SURFACE
      ?auto_17196 - SURFACE
      ?auto_17197 - SURFACE
      ?auto_17199 - SURFACE
      ?auto_17198 - SURFACE
      ?auto_17200 - SURFACE
    )
    :vars
    (
      ?auto_17203 - HOIST
      ?auto_17205 - PLACE
      ?auto_17204 - TRUCK
      ?auto_17202 - PLACE
      ?auto_17201 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_17203 ?auto_17205 ) ( SURFACE-AT ?auto_17198 ?auto_17205 ) ( CLEAR ?auto_17198 ) ( IS-CRATE ?auto_17200 ) ( not ( = ?auto_17198 ?auto_17200 ) ) ( AVAILABLE ?auto_17203 ) ( ON ?auto_17198 ?auto_17199 ) ( not ( = ?auto_17199 ?auto_17198 ) ) ( not ( = ?auto_17199 ?auto_17200 ) ) ( TRUCK-AT ?auto_17204 ?auto_17202 ) ( not ( = ?auto_17202 ?auto_17205 ) ) ( HOIST-AT ?auto_17201 ?auto_17202 ) ( LIFTING ?auto_17201 ?auto_17200 ) ( not ( = ?auto_17203 ?auto_17201 ) ) ( ON ?auto_17196 ?auto_17195 ) ( ON ?auto_17197 ?auto_17196 ) ( ON ?auto_17199 ?auto_17197 ) ( not ( = ?auto_17195 ?auto_17196 ) ) ( not ( = ?auto_17195 ?auto_17197 ) ) ( not ( = ?auto_17195 ?auto_17199 ) ) ( not ( = ?auto_17195 ?auto_17198 ) ) ( not ( = ?auto_17195 ?auto_17200 ) ) ( not ( = ?auto_17196 ?auto_17197 ) ) ( not ( = ?auto_17196 ?auto_17199 ) ) ( not ( = ?auto_17196 ?auto_17198 ) ) ( not ( = ?auto_17196 ?auto_17200 ) ) ( not ( = ?auto_17197 ?auto_17199 ) ) ( not ( = ?auto_17197 ?auto_17198 ) ) ( not ( = ?auto_17197 ?auto_17200 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17199 ?auto_17198 ?auto_17200 )
      ( MAKE-5CRATE-VERIFY ?auto_17195 ?auto_17196 ?auto_17197 ?auto_17199 ?auto_17198 ?auto_17200 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_17245 - SURFACE
      ?auto_17246 - SURFACE
      ?auto_17247 - SURFACE
      ?auto_17249 - SURFACE
      ?auto_17248 - SURFACE
      ?auto_17250 - SURFACE
    )
    :vars
    (
      ?auto_17252 - HOIST
      ?auto_17253 - PLACE
      ?auto_17254 - TRUCK
      ?auto_17256 - PLACE
      ?auto_17255 - HOIST
      ?auto_17251 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_17252 ?auto_17253 ) ( SURFACE-AT ?auto_17248 ?auto_17253 ) ( CLEAR ?auto_17248 ) ( IS-CRATE ?auto_17250 ) ( not ( = ?auto_17248 ?auto_17250 ) ) ( AVAILABLE ?auto_17252 ) ( ON ?auto_17248 ?auto_17249 ) ( not ( = ?auto_17249 ?auto_17248 ) ) ( not ( = ?auto_17249 ?auto_17250 ) ) ( TRUCK-AT ?auto_17254 ?auto_17256 ) ( not ( = ?auto_17256 ?auto_17253 ) ) ( HOIST-AT ?auto_17255 ?auto_17256 ) ( not ( = ?auto_17252 ?auto_17255 ) ) ( AVAILABLE ?auto_17255 ) ( SURFACE-AT ?auto_17250 ?auto_17256 ) ( ON ?auto_17250 ?auto_17251 ) ( CLEAR ?auto_17250 ) ( not ( = ?auto_17248 ?auto_17251 ) ) ( not ( = ?auto_17250 ?auto_17251 ) ) ( not ( = ?auto_17249 ?auto_17251 ) ) ( ON ?auto_17246 ?auto_17245 ) ( ON ?auto_17247 ?auto_17246 ) ( ON ?auto_17249 ?auto_17247 ) ( not ( = ?auto_17245 ?auto_17246 ) ) ( not ( = ?auto_17245 ?auto_17247 ) ) ( not ( = ?auto_17245 ?auto_17249 ) ) ( not ( = ?auto_17245 ?auto_17248 ) ) ( not ( = ?auto_17245 ?auto_17250 ) ) ( not ( = ?auto_17245 ?auto_17251 ) ) ( not ( = ?auto_17246 ?auto_17247 ) ) ( not ( = ?auto_17246 ?auto_17249 ) ) ( not ( = ?auto_17246 ?auto_17248 ) ) ( not ( = ?auto_17246 ?auto_17250 ) ) ( not ( = ?auto_17246 ?auto_17251 ) ) ( not ( = ?auto_17247 ?auto_17249 ) ) ( not ( = ?auto_17247 ?auto_17248 ) ) ( not ( = ?auto_17247 ?auto_17250 ) ) ( not ( = ?auto_17247 ?auto_17251 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17249 ?auto_17248 ?auto_17250 )
      ( MAKE-5CRATE-VERIFY ?auto_17245 ?auto_17246 ?auto_17247 ?auto_17249 ?auto_17248 ?auto_17250 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_17296 - SURFACE
      ?auto_17297 - SURFACE
      ?auto_17298 - SURFACE
      ?auto_17300 - SURFACE
      ?auto_17299 - SURFACE
      ?auto_17301 - SURFACE
    )
    :vars
    (
      ?auto_17304 - HOIST
      ?auto_17306 - PLACE
      ?auto_17305 - PLACE
      ?auto_17307 - HOIST
      ?auto_17303 - SURFACE
      ?auto_17302 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17304 ?auto_17306 ) ( SURFACE-AT ?auto_17299 ?auto_17306 ) ( CLEAR ?auto_17299 ) ( IS-CRATE ?auto_17301 ) ( not ( = ?auto_17299 ?auto_17301 ) ) ( AVAILABLE ?auto_17304 ) ( ON ?auto_17299 ?auto_17300 ) ( not ( = ?auto_17300 ?auto_17299 ) ) ( not ( = ?auto_17300 ?auto_17301 ) ) ( not ( = ?auto_17305 ?auto_17306 ) ) ( HOIST-AT ?auto_17307 ?auto_17305 ) ( not ( = ?auto_17304 ?auto_17307 ) ) ( AVAILABLE ?auto_17307 ) ( SURFACE-AT ?auto_17301 ?auto_17305 ) ( ON ?auto_17301 ?auto_17303 ) ( CLEAR ?auto_17301 ) ( not ( = ?auto_17299 ?auto_17303 ) ) ( not ( = ?auto_17301 ?auto_17303 ) ) ( not ( = ?auto_17300 ?auto_17303 ) ) ( TRUCK-AT ?auto_17302 ?auto_17306 ) ( ON ?auto_17297 ?auto_17296 ) ( ON ?auto_17298 ?auto_17297 ) ( ON ?auto_17300 ?auto_17298 ) ( not ( = ?auto_17296 ?auto_17297 ) ) ( not ( = ?auto_17296 ?auto_17298 ) ) ( not ( = ?auto_17296 ?auto_17300 ) ) ( not ( = ?auto_17296 ?auto_17299 ) ) ( not ( = ?auto_17296 ?auto_17301 ) ) ( not ( = ?auto_17296 ?auto_17303 ) ) ( not ( = ?auto_17297 ?auto_17298 ) ) ( not ( = ?auto_17297 ?auto_17300 ) ) ( not ( = ?auto_17297 ?auto_17299 ) ) ( not ( = ?auto_17297 ?auto_17301 ) ) ( not ( = ?auto_17297 ?auto_17303 ) ) ( not ( = ?auto_17298 ?auto_17300 ) ) ( not ( = ?auto_17298 ?auto_17299 ) ) ( not ( = ?auto_17298 ?auto_17301 ) ) ( not ( = ?auto_17298 ?auto_17303 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17300 ?auto_17299 ?auto_17301 )
      ( MAKE-5CRATE-VERIFY ?auto_17296 ?auto_17297 ?auto_17298 ?auto_17300 ?auto_17299 ?auto_17301 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_17347 - SURFACE
      ?auto_17348 - SURFACE
      ?auto_17349 - SURFACE
      ?auto_17351 - SURFACE
      ?auto_17350 - SURFACE
      ?auto_17352 - SURFACE
    )
    :vars
    (
      ?auto_17354 - HOIST
      ?auto_17357 - PLACE
      ?auto_17358 - PLACE
      ?auto_17353 - HOIST
      ?auto_17355 - SURFACE
      ?auto_17356 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17354 ?auto_17357 ) ( IS-CRATE ?auto_17352 ) ( not ( = ?auto_17350 ?auto_17352 ) ) ( not ( = ?auto_17351 ?auto_17350 ) ) ( not ( = ?auto_17351 ?auto_17352 ) ) ( not ( = ?auto_17358 ?auto_17357 ) ) ( HOIST-AT ?auto_17353 ?auto_17358 ) ( not ( = ?auto_17354 ?auto_17353 ) ) ( AVAILABLE ?auto_17353 ) ( SURFACE-AT ?auto_17352 ?auto_17358 ) ( ON ?auto_17352 ?auto_17355 ) ( CLEAR ?auto_17352 ) ( not ( = ?auto_17350 ?auto_17355 ) ) ( not ( = ?auto_17352 ?auto_17355 ) ) ( not ( = ?auto_17351 ?auto_17355 ) ) ( TRUCK-AT ?auto_17356 ?auto_17357 ) ( SURFACE-AT ?auto_17351 ?auto_17357 ) ( CLEAR ?auto_17351 ) ( LIFTING ?auto_17354 ?auto_17350 ) ( IS-CRATE ?auto_17350 ) ( ON ?auto_17348 ?auto_17347 ) ( ON ?auto_17349 ?auto_17348 ) ( ON ?auto_17351 ?auto_17349 ) ( not ( = ?auto_17347 ?auto_17348 ) ) ( not ( = ?auto_17347 ?auto_17349 ) ) ( not ( = ?auto_17347 ?auto_17351 ) ) ( not ( = ?auto_17347 ?auto_17350 ) ) ( not ( = ?auto_17347 ?auto_17352 ) ) ( not ( = ?auto_17347 ?auto_17355 ) ) ( not ( = ?auto_17348 ?auto_17349 ) ) ( not ( = ?auto_17348 ?auto_17351 ) ) ( not ( = ?auto_17348 ?auto_17350 ) ) ( not ( = ?auto_17348 ?auto_17352 ) ) ( not ( = ?auto_17348 ?auto_17355 ) ) ( not ( = ?auto_17349 ?auto_17351 ) ) ( not ( = ?auto_17349 ?auto_17350 ) ) ( not ( = ?auto_17349 ?auto_17352 ) ) ( not ( = ?auto_17349 ?auto_17355 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17351 ?auto_17350 ?auto_17352 )
      ( MAKE-5CRATE-VERIFY ?auto_17347 ?auto_17348 ?auto_17349 ?auto_17351 ?auto_17350 ?auto_17352 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_17398 - SURFACE
      ?auto_17399 - SURFACE
      ?auto_17400 - SURFACE
      ?auto_17402 - SURFACE
      ?auto_17401 - SURFACE
      ?auto_17403 - SURFACE
    )
    :vars
    (
      ?auto_17405 - HOIST
      ?auto_17404 - PLACE
      ?auto_17406 - PLACE
      ?auto_17408 - HOIST
      ?auto_17407 - SURFACE
      ?auto_17409 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17405 ?auto_17404 ) ( IS-CRATE ?auto_17403 ) ( not ( = ?auto_17401 ?auto_17403 ) ) ( not ( = ?auto_17402 ?auto_17401 ) ) ( not ( = ?auto_17402 ?auto_17403 ) ) ( not ( = ?auto_17406 ?auto_17404 ) ) ( HOIST-AT ?auto_17408 ?auto_17406 ) ( not ( = ?auto_17405 ?auto_17408 ) ) ( AVAILABLE ?auto_17408 ) ( SURFACE-AT ?auto_17403 ?auto_17406 ) ( ON ?auto_17403 ?auto_17407 ) ( CLEAR ?auto_17403 ) ( not ( = ?auto_17401 ?auto_17407 ) ) ( not ( = ?auto_17403 ?auto_17407 ) ) ( not ( = ?auto_17402 ?auto_17407 ) ) ( TRUCK-AT ?auto_17409 ?auto_17404 ) ( SURFACE-AT ?auto_17402 ?auto_17404 ) ( CLEAR ?auto_17402 ) ( IS-CRATE ?auto_17401 ) ( AVAILABLE ?auto_17405 ) ( IN ?auto_17401 ?auto_17409 ) ( ON ?auto_17399 ?auto_17398 ) ( ON ?auto_17400 ?auto_17399 ) ( ON ?auto_17402 ?auto_17400 ) ( not ( = ?auto_17398 ?auto_17399 ) ) ( not ( = ?auto_17398 ?auto_17400 ) ) ( not ( = ?auto_17398 ?auto_17402 ) ) ( not ( = ?auto_17398 ?auto_17401 ) ) ( not ( = ?auto_17398 ?auto_17403 ) ) ( not ( = ?auto_17398 ?auto_17407 ) ) ( not ( = ?auto_17399 ?auto_17400 ) ) ( not ( = ?auto_17399 ?auto_17402 ) ) ( not ( = ?auto_17399 ?auto_17401 ) ) ( not ( = ?auto_17399 ?auto_17403 ) ) ( not ( = ?auto_17399 ?auto_17407 ) ) ( not ( = ?auto_17400 ?auto_17402 ) ) ( not ( = ?auto_17400 ?auto_17401 ) ) ( not ( = ?auto_17400 ?auto_17403 ) ) ( not ( = ?auto_17400 ?auto_17407 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17402 ?auto_17401 ?auto_17403 )
      ( MAKE-5CRATE-VERIFY ?auto_17398 ?auto_17399 ?auto_17400 ?auto_17402 ?auto_17401 ?auto_17403 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18078 - SURFACE
      ?auto_18079 - SURFACE
    )
    :vars
    (
      ?auto_18086 - HOIST
      ?auto_18083 - PLACE
      ?auto_18081 - SURFACE
      ?auto_18080 - PLACE
      ?auto_18084 - HOIST
      ?auto_18082 - SURFACE
      ?auto_18085 - TRUCK
      ?auto_18087 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18086 ?auto_18083 ) ( SURFACE-AT ?auto_18078 ?auto_18083 ) ( CLEAR ?auto_18078 ) ( IS-CRATE ?auto_18079 ) ( not ( = ?auto_18078 ?auto_18079 ) ) ( ON ?auto_18078 ?auto_18081 ) ( not ( = ?auto_18081 ?auto_18078 ) ) ( not ( = ?auto_18081 ?auto_18079 ) ) ( not ( = ?auto_18080 ?auto_18083 ) ) ( HOIST-AT ?auto_18084 ?auto_18080 ) ( not ( = ?auto_18086 ?auto_18084 ) ) ( AVAILABLE ?auto_18084 ) ( SURFACE-AT ?auto_18079 ?auto_18080 ) ( ON ?auto_18079 ?auto_18082 ) ( CLEAR ?auto_18079 ) ( not ( = ?auto_18078 ?auto_18082 ) ) ( not ( = ?auto_18079 ?auto_18082 ) ) ( not ( = ?auto_18081 ?auto_18082 ) ) ( TRUCK-AT ?auto_18085 ?auto_18083 ) ( LIFTING ?auto_18086 ?auto_18087 ) ( IS-CRATE ?auto_18087 ) ( not ( = ?auto_18078 ?auto_18087 ) ) ( not ( = ?auto_18079 ?auto_18087 ) ) ( not ( = ?auto_18081 ?auto_18087 ) ) ( not ( = ?auto_18082 ?auto_18087 ) ) )
    :subtasks
    ( ( !LOAD ?auto_18086 ?auto_18087 ?auto_18085 ?auto_18083 )
      ( MAKE-1CRATE ?auto_18078 ?auto_18079 )
      ( MAKE-1CRATE-VERIFY ?auto_18078 ?auto_18079 ) )
  )

)

