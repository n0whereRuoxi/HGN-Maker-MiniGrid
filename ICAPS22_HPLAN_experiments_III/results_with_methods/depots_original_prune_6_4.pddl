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
      ?auto_49505 - SURFACE
      ?auto_49506 - SURFACE
    )
    :vars
    (
      ?auto_49507 - HOIST
      ?auto_49508 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_49507 ?auto_49508 ) ( SURFACE-AT ?auto_49505 ?auto_49508 ) ( CLEAR ?auto_49505 ) ( LIFTING ?auto_49507 ?auto_49506 ) ( IS-CRATE ?auto_49506 ) ( not ( = ?auto_49505 ?auto_49506 ) ) )
    :subtasks
    ( ( !DROP ?auto_49507 ?auto_49506 ?auto_49505 ?auto_49508 )
      ( MAKE-1CRATE-VERIFY ?auto_49505 ?auto_49506 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_49509 - SURFACE
      ?auto_49510 - SURFACE
    )
    :vars
    (
      ?auto_49512 - HOIST
      ?auto_49511 - PLACE
      ?auto_49513 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_49512 ?auto_49511 ) ( SURFACE-AT ?auto_49509 ?auto_49511 ) ( CLEAR ?auto_49509 ) ( IS-CRATE ?auto_49510 ) ( not ( = ?auto_49509 ?auto_49510 ) ) ( TRUCK-AT ?auto_49513 ?auto_49511 ) ( AVAILABLE ?auto_49512 ) ( IN ?auto_49510 ?auto_49513 ) )
    :subtasks
    ( ( !UNLOAD ?auto_49512 ?auto_49510 ?auto_49513 ?auto_49511 )
      ( MAKE-1CRATE ?auto_49509 ?auto_49510 )
      ( MAKE-1CRATE-VERIFY ?auto_49509 ?auto_49510 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_49514 - SURFACE
      ?auto_49515 - SURFACE
    )
    :vars
    (
      ?auto_49516 - HOIST
      ?auto_49518 - PLACE
      ?auto_49517 - TRUCK
      ?auto_49519 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_49516 ?auto_49518 ) ( SURFACE-AT ?auto_49514 ?auto_49518 ) ( CLEAR ?auto_49514 ) ( IS-CRATE ?auto_49515 ) ( not ( = ?auto_49514 ?auto_49515 ) ) ( AVAILABLE ?auto_49516 ) ( IN ?auto_49515 ?auto_49517 ) ( TRUCK-AT ?auto_49517 ?auto_49519 ) ( not ( = ?auto_49519 ?auto_49518 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_49517 ?auto_49519 ?auto_49518 )
      ( MAKE-1CRATE ?auto_49514 ?auto_49515 )
      ( MAKE-1CRATE-VERIFY ?auto_49514 ?auto_49515 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_49520 - SURFACE
      ?auto_49521 - SURFACE
    )
    :vars
    (
      ?auto_49522 - HOIST
      ?auto_49523 - PLACE
      ?auto_49525 - TRUCK
      ?auto_49524 - PLACE
      ?auto_49526 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_49522 ?auto_49523 ) ( SURFACE-AT ?auto_49520 ?auto_49523 ) ( CLEAR ?auto_49520 ) ( IS-CRATE ?auto_49521 ) ( not ( = ?auto_49520 ?auto_49521 ) ) ( AVAILABLE ?auto_49522 ) ( TRUCK-AT ?auto_49525 ?auto_49524 ) ( not ( = ?auto_49524 ?auto_49523 ) ) ( HOIST-AT ?auto_49526 ?auto_49524 ) ( LIFTING ?auto_49526 ?auto_49521 ) ( not ( = ?auto_49522 ?auto_49526 ) ) )
    :subtasks
    ( ( !LOAD ?auto_49526 ?auto_49521 ?auto_49525 ?auto_49524 )
      ( MAKE-1CRATE ?auto_49520 ?auto_49521 )
      ( MAKE-1CRATE-VERIFY ?auto_49520 ?auto_49521 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_49527 - SURFACE
      ?auto_49528 - SURFACE
    )
    :vars
    (
      ?auto_49532 - HOIST
      ?auto_49531 - PLACE
      ?auto_49530 - TRUCK
      ?auto_49533 - PLACE
      ?auto_49529 - HOIST
      ?auto_49534 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_49532 ?auto_49531 ) ( SURFACE-AT ?auto_49527 ?auto_49531 ) ( CLEAR ?auto_49527 ) ( IS-CRATE ?auto_49528 ) ( not ( = ?auto_49527 ?auto_49528 ) ) ( AVAILABLE ?auto_49532 ) ( TRUCK-AT ?auto_49530 ?auto_49533 ) ( not ( = ?auto_49533 ?auto_49531 ) ) ( HOIST-AT ?auto_49529 ?auto_49533 ) ( not ( = ?auto_49532 ?auto_49529 ) ) ( AVAILABLE ?auto_49529 ) ( SURFACE-AT ?auto_49528 ?auto_49533 ) ( ON ?auto_49528 ?auto_49534 ) ( CLEAR ?auto_49528 ) ( not ( = ?auto_49527 ?auto_49534 ) ) ( not ( = ?auto_49528 ?auto_49534 ) ) )
    :subtasks
    ( ( !LIFT ?auto_49529 ?auto_49528 ?auto_49534 ?auto_49533 )
      ( MAKE-1CRATE ?auto_49527 ?auto_49528 )
      ( MAKE-1CRATE-VERIFY ?auto_49527 ?auto_49528 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_49535 - SURFACE
      ?auto_49536 - SURFACE
    )
    :vars
    (
      ?auto_49538 - HOIST
      ?auto_49542 - PLACE
      ?auto_49540 - PLACE
      ?auto_49539 - HOIST
      ?auto_49541 - SURFACE
      ?auto_49537 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_49538 ?auto_49542 ) ( SURFACE-AT ?auto_49535 ?auto_49542 ) ( CLEAR ?auto_49535 ) ( IS-CRATE ?auto_49536 ) ( not ( = ?auto_49535 ?auto_49536 ) ) ( AVAILABLE ?auto_49538 ) ( not ( = ?auto_49540 ?auto_49542 ) ) ( HOIST-AT ?auto_49539 ?auto_49540 ) ( not ( = ?auto_49538 ?auto_49539 ) ) ( AVAILABLE ?auto_49539 ) ( SURFACE-AT ?auto_49536 ?auto_49540 ) ( ON ?auto_49536 ?auto_49541 ) ( CLEAR ?auto_49536 ) ( not ( = ?auto_49535 ?auto_49541 ) ) ( not ( = ?auto_49536 ?auto_49541 ) ) ( TRUCK-AT ?auto_49537 ?auto_49542 ) )
    :subtasks
    ( ( !DRIVE ?auto_49537 ?auto_49542 ?auto_49540 )
      ( MAKE-1CRATE ?auto_49535 ?auto_49536 )
      ( MAKE-1CRATE-VERIFY ?auto_49535 ?auto_49536 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_49552 - SURFACE
      ?auto_49553 - SURFACE
      ?auto_49554 - SURFACE
    )
    :vars
    (
      ?auto_49556 - HOIST
      ?auto_49555 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_49556 ?auto_49555 ) ( SURFACE-AT ?auto_49553 ?auto_49555 ) ( CLEAR ?auto_49553 ) ( LIFTING ?auto_49556 ?auto_49554 ) ( IS-CRATE ?auto_49554 ) ( not ( = ?auto_49553 ?auto_49554 ) ) ( ON ?auto_49553 ?auto_49552 ) ( not ( = ?auto_49552 ?auto_49553 ) ) ( not ( = ?auto_49552 ?auto_49554 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_49553 ?auto_49554 )
      ( MAKE-2CRATE-VERIFY ?auto_49552 ?auto_49553 ?auto_49554 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_49562 - SURFACE
      ?auto_49563 - SURFACE
      ?auto_49564 - SURFACE
    )
    :vars
    (
      ?auto_49567 - HOIST
      ?auto_49565 - PLACE
      ?auto_49566 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_49567 ?auto_49565 ) ( SURFACE-AT ?auto_49563 ?auto_49565 ) ( CLEAR ?auto_49563 ) ( IS-CRATE ?auto_49564 ) ( not ( = ?auto_49563 ?auto_49564 ) ) ( TRUCK-AT ?auto_49566 ?auto_49565 ) ( AVAILABLE ?auto_49567 ) ( IN ?auto_49564 ?auto_49566 ) ( ON ?auto_49563 ?auto_49562 ) ( not ( = ?auto_49562 ?auto_49563 ) ) ( not ( = ?auto_49562 ?auto_49564 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_49563 ?auto_49564 )
      ( MAKE-2CRATE-VERIFY ?auto_49562 ?auto_49563 ?auto_49564 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_49568 - SURFACE
      ?auto_49569 - SURFACE
    )
    :vars
    (
      ?auto_49570 - HOIST
      ?auto_49572 - PLACE
      ?auto_49571 - TRUCK
      ?auto_49573 - SURFACE
      ?auto_49574 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_49570 ?auto_49572 ) ( SURFACE-AT ?auto_49568 ?auto_49572 ) ( CLEAR ?auto_49568 ) ( IS-CRATE ?auto_49569 ) ( not ( = ?auto_49568 ?auto_49569 ) ) ( AVAILABLE ?auto_49570 ) ( IN ?auto_49569 ?auto_49571 ) ( ON ?auto_49568 ?auto_49573 ) ( not ( = ?auto_49573 ?auto_49568 ) ) ( not ( = ?auto_49573 ?auto_49569 ) ) ( TRUCK-AT ?auto_49571 ?auto_49574 ) ( not ( = ?auto_49574 ?auto_49572 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_49571 ?auto_49574 ?auto_49572 )
      ( MAKE-2CRATE ?auto_49573 ?auto_49568 ?auto_49569 )
      ( MAKE-1CRATE-VERIFY ?auto_49568 ?auto_49569 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_49575 - SURFACE
      ?auto_49576 - SURFACE
      ?auto_49577 - SURFACE
    )
    :vars
    (
      ?auto_49579 - HOIST
      ?auto_49581 - PLACE
      ?auto_49578 - TRUCK
      ?auto_49580 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_49579 ?auto_49581 ) ( SURFACE-AT ?auto_49576 ?auto_49581 ) ( CLEAR ?auto_49576 ) ( IS-CRATE ?auto_49577 ) ( not ( = ?auto_49576 ?auto_49577 ) ) ( AVAILABLE ?auto_49579 ) ( IN ?auto_49577 ?auto_49578 ) ( ON ?auto_49576 ?auto_49575 ) ( not ( = ?auto_49575 ?auto_49576 ) ) ( not ( = ?auto_49575 ?auto_49577 ) ) ( TRUCK-AT ?auto_49578 ?auto_49580 ) ( not ( = ?auto_49580 ?auto_49581 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_49576 ?auto_49577 )
      ( MAKE-2CRATE-VERIFY ?auto_49575 ?auto_49576 ?auto_49577 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_49582 - SURFACE
      ?auto_49583 - SURFACE
    )
    :vars
    (
      ?auto_49587 - HOIST
      ?auto_49588 - PLACE
      ?auto_49585 - SURFACE
      ?auto_49584 - TRUCK
      ?auto_49586 - PLACE
      ?auto_49589 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_49587 ?auto_49588 ) ( SURFACE-AT ?auto_49582 ?auto_49588 ) ( CLEAR ?auto_49582 ) ( IS-CRATE ?auto_49583 ) ( not ( = ?auto_49582 ?auto_49583 ) ) ( AVAILABLE ?auto_49587 ) ( ON ?auto_49582 ?auto_49585 ) ( not ( = ?auto_49585 ?auto_49582 ) ) ( not ( = ?auto_49585 ?auto_49583 ) ) ( TRUCK-AT ?auto_49584 ?auto_49586 ) ( not ( = ?auto_49586 ?auto_49588 ) ) ( HOIST-AT ?auto_49589 ?auto_49586 ) ( LIFTING ?auto_49589 ?auto_49583 ) ( not ( = ?auto_49587 ?auto_49589 ) ) )
    :subtasks
    ( ( !LOAD ?auto_49589 ?auto_49583 ?auto_49584 ?auto_49586 )
      ( MAKE-2CRATE ?auto_49585 ?auto_49582 ?auto_49583 )
      ( MAKE-1CRATE-VERIFY ?auto_49582 ?auto_49583 ) )
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
      ?auto_49595 - HOIST
      ?auto_49596 - PLACE
      ?auto_49594 - TRUCK
      ?auto_49593 - PLACE
      ?auto_49597 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_49595 ?auto_49596 ) ( SURFACE-AT ?auto_49591 ?auto_49596 ) ( CLEAR ?auto_49591 ) ( IS-CRATE ?auto_49592 ) ( not ( = ?auto_49591 ?auto_49592 ) ) ( AVAILABLE ?auto_49595 ) ( ON ?auto_49591 ?auto_49590 ) ( not ( = ?auto_49590 ?auto_49591 ) ) ( not ( = ?auto_49590 ?auto_49592 ) ) ( TRUCK-AT ?auto_49594 ?auto_49593 ) ( not ( = ?auto_49593 ?auto_49596 ) ) ( HOIST-AT ?auto_49597 ?auto_49593 ) ( LIFTING ?auto_49597 ?auto_49592 ) ( not ( = ?auto_49595 ?auto_49597 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_49591 ?auto_49592 )
      ( MAKE-2CRATE-VERIFY ?auto_49590 ?auto_49591 ?auto_49592 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_49598 - SURFACE
      ?auto_49599 - SURFACE
    )
    :vars
    (
      ?auto_49605 - HOIST
      ?auto_49601 - PLACE
      ?auto_49600 - SURFACE
      ?auto_49603 - TRUCK
      ?auto_49602 - PLACE
      ?auto_49604 - HOIST
      ?auto_49606 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_49605 ?auto_49601 ) ( SURFACE-AT ?auto_49598 ?auto_49601 ) ( CLEAR ?auto_49598 ) ( IS-CRATE ?auto_49599 ) ( not ( = ?auto_49598 ?auto_49599 ) ) ( AVAILABLE ?auto_49605 ) ( ON ?auto_49598 ?auto_49600 ) ( not ( = ?auto_49600 ?auto_49598 ) ) ( not ( = ?auto_49600 ?auto_49599 ) ) ( TRUCK-AT ?auto_49603 ?auto_49602 ) ( not ( = ?auto_49602 ?auto_49601 ) ) ( HOIST-AT ?auto_49604 ?auto_49602 ) ( not ( = ?auto_49605 ?auto_49604 ) ) ( AVAILABLE ?auto_49604 ) ( SURFACE-AT ?auto_49599 ?auto_49602 ) ( ON ?auto_49599 ?auto_49606 ) ( CLEAR ?auto_49599 ) ( not ( = ?auto_49598 ?auto_49606 ) ) ( not ( = ?auto_49599 ?auto_49606 ) ) ( not ( = ?auto_49600 ?auto_49606 ) ) )
    :subtasks
    ( ( !LIFT ?auto_49604 ?auto_49599 ?auto_49606 ?auto_49602 )
      ( MAKE-2CRATE ?auto_49600 ?auto_49598 ?auto_49599 )
      ( MAKE-1CRATE-VERIFY ?auto_49598 ?auto_49599 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_49607 - SURFACE
      ?auto_49608 - SURFACE
      ?auto_49609 - SURFACE
    )
    :vars
    (
      ?auto_49610 - HOIST
      ?auto_49615 - PLACE
      ?auto_49614 - TRUCK
      ?auto_49611 - PLACE
      ?auto_49613 - HOIST
      ?auto_49612 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_49610 ?auto_49615 ) ( SURFACE-AT ?auto_49608 ?auto_49615 ) ( CLEAR ?auto_49608 ) ( IS-CRATE ?auto_49609 ) ( not ( = ?auto_49608 ?auto_49609 ) ) ( AVAILABLE ?auto_49610 ) ( ON ?auto_49608 ?auto_49607 ) ( not ( = ?auto_49607 ?auto_49608 ) ) ( not ( = ?auto_49607 ?auto_49609 ) ) ( TRUCK-AT ?auto_49614 ?auto_49611 ) ( not ( = ?auto_49611 ?auto_49615 ) ) ( HOIST-AT ?auto_49613 ?auto_49611 ) ( not ( = ?auto_49610 ?auto_49613 ) ) ( AVAILABLE ?auto_49613 ) ( SURFACE-AT ?auto_49609 ?auto_49611 ) ( ON ?auto_49609 ?auto_49612 ) ( CLEAR ?auto_49609 ) ( not ( = ?auto_49608 ?auto_49612 ) ) ( not ( = ?auto_49609 ?auto_49612 ) ) ( not ( = ?auto_49607 ?auto_49612 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_49608 ?auto_49609 )
      ( MAKE-2CRATE-VERIFY ?auto_49607 ?auto_49608 ?auto_49609 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_49616 - SURFACE
      ?auto_49617 - SURFACE
    )
    :vars
    (
      ?auto_49619 - HOIST
      ?auto_49623 - PLACE
      ?auto_49622 - SURFACE
      ?auto_49621 - PLACE
      ?auto_49624 - HOIST
      ?auto_49618 - SURFACE
      ?auto_49620 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_49619 ?auto_49623 ) ( SURFACE-AT ?auto_49616 ?auto_49623 ) ( CLEAR ?auto_49616 ) ( IS-CRATE ?auto_49617 ) ( not ( = ?auto_49616 ?auto_49617 ) ) ( AVAILABLE ?auto_49619 ) ( ON ?auto_49616 ?auto_49622 ) ( not ( = ?auto_49622 ?auto_49616 ) ) ( not ( = ?auto_49622 ?auto_49617 ) ) ( not ( = ?auto_49621 ?auto_49623 ) ) ( HOIST-AT ?auto_49624 ?auto_49621 ) ( not ( = ?auto_49619 ?auto_49624 ) ) ( AVAILABLE ?auto_49624 ) ( SURFACE-AT ?auto_49617 ?auto_49621 ) ( ON ?auto_49617 ?auto_49618 ) ( CLEAR ?auto_49617 ) ( not ( = ?auto_49616 ?auto_49618 ) ) ( not ( = ?auto_49617 ?auto_49618 ) ) ( not ( = ?auto_49622 ?auto_49618 ) ) ( TRUCK-AT ?auto_49620 ?auto_49623 ) )
    :subtasks
    ( ( !DRIVE ?auto_49620 ?auto_49623 ?auto_49621 )
      ( MAKE-2CRATE ?auto_49622 ?auto_49616 ?auto_49617 )
      ( MAKE-1CRATE-VERIFY ?auto_49616 ?auto_49617 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_49625 - SURFACE
      ?auto_49626 - SURFACE
      ?auto_49627 - SURFACE
    )
    :vars
    (
      ?auto_49630 - HOIST
      ?auto_49629 - PLACE
      ?auto_49632 - PLACE
      ?auto_49631 - HOIST
      ?auto_49628 - SURFACE
      ?auto_49633 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_49630 ?auto_49629 ) ( SURFACE-AT ?auto_49626 ?auto_49629 ) ( CLEAR ?auto_49626 ) ( IS-CRATE ?auto_49627 ) ( not ( = ?auto_49626 ?auto_49627 ) ) ( AVAILABLE ?auto_49630 ) ( ON ?auto_49626 ?auto_49625 ) ( not ( = ?auto_49625 ?auto_49626 ) ) ( not ( = ?auto_49625 ?auto_49627 ) ) ( not ( = ?auto_49632 ?auto_49629 ) ) ( HOIST-AT ?auto_49631 ?auto_49632 ) ( not ( = ?auto_49630 ?auto_49631 ) ) ( AVAILABLE ?auto_49631 ) ( SURFACE-AT ?auto_49627 ?auto_49632 ) ( ON ?auto_49627 ?auto_49628 ) ( CLEAR ?auto_49627 ) ( not ( = ?auto_49626 ?auto_49628 ) ) ( not ( = ?auto_49627 ?auto_49628 ) ) ( not ( = ?auto_49625 ?auto_49628 ) ) ( TRUCK-AT ?auto_49633 ?auto_49629 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_49626 ?auto_49627 )
      ( MAKE-2CRATE-VERIFY ?auto_49625 ?auto_49626 ?auto_49627 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_49634 - SURFACE
      ?auto_49635 - SURFACE
    )
    :vars
    (
      ?auto_49637 - HOIST
      ?auto_49642 - PLACE
      ?auto_49636 - SURFACE
      ?auto_49640 - PLACE
      ?auto_49639 - HOIST
      ?auto_49638 - SURFACE
      ?auto_49641 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_49637 ?auto_49642 ) ( IS-CRATE ?auto_49635 ) ( not ( = ?auto_49634 ?auto_49635 ) ) ( not ( = ?auto_49636 ?auto_49634 ) ) ( not ( = ?auto_49636 ?auto_49635 ) ) ( not ( = ?auto_49640 ?auto_49642 ) ) ( HOIST-AT ?auto_49639 ?auto_49640 ) ( not ( = ?auto_49637 ?auto_49639 ) ) ( AVAILABLE ?auto_49639 ) ( SURFACE-AT ?auto_49635 ?auto_49640 ) ( ON ?auto_49635 ?auto_49638 ) ( CLEAR ?auto_49635 ) ( not ( = ?auto_49634 ?auto_49638 ) ) ( not ( = ?auto_49635 ?auto_49638 ) ) ( not ( = ?auto_49636 ?auto_49638 ) ) ( TRUCK-AT ?auto_49641 ?auto_49642 ) ( SURFACE-AT ?auto_49636 ?auto_49642 ) ( CLEAR ?auto_49636 ) ( LIFTING ?auto_49637 ?auto_49634 ) ( IS-CRATE ?auto_49634 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_49636 ?auto_49634 )
      ( MAKE-2CRATE ?auto_49636 ?auto_49634 ?auto_49635 )
      ( MAKE-1CRATE-VERIFY ?auto_49634 ?auto_49635 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_49643 - SURFACE
      ?auto_49644 - SURFACE
      ?auto_49645 - SURFACE
    )
    :vars
    (
      ?auto_49648 - HOIST
      ?auto_49646 - PLACE
      ?auto_49650 - PLACE
      ?auto_49651 - HOIST
      ?auto_49649 - SURFACE
      ?auto_49647 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_49648 ?auto_49646 ) ( IS-CRATE ?auto_49645 ) ( not ( = ?auto_49644 ?auto_49645 ) ) ( not ( = ?auto_49643 ?auto_49644 ) ) ( not ( = ?auto_49643 ?auto_49645 ) ) ( not ( = ?auto_49650 ?auto_49646 ) ) ( HOIST-AT ?auto_49651 ?auto_49650 ) ( not ( = ?auto_49648 ?auto_49651 ) ) ( AVAILABLE ?auto_49651 ) ( SURFACE-AT ?auto_49645 ?auto_49650 ) ( ON ?auto_49645 ?auto_49649 ) ( CLEAR ?auto_49645 ) ( not ( = ?auto_49644 ?auto_49649 ) ) ( not ( = ?auto_49645 ?auto_49649 ) ) ( not ( = ?auto_49643 ?auto_49649 ) ) ( TRUCK-AT ?auto_49647 ?auto_49646 ) ( SURFACE-AT ?auto_49643 ?auto_49646 ) ( CLEAR ?auto_49643 ) ( LIFTING ?auto_49648 ?auto_49644 ) ( IS-CRATE ?auto_49644 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_49644 ?auto_49645 )
      ( MAKE-2CRATE-VERIFY ?auto_49643 ?auto_49644 ?auto_49645 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_49652 - SURFACE
      ?auto_49653 - SURFACE
    )
    :vars
    (
      ?auto_49655 - HOIST
      ?auto_49660 - PLACE
      ?auto_49656 - SURFACE
      ?auto_49659 - PLACE
      ?auto_49654 - HOIST
      ?auto_49658 - SURFACE
      ?auto_49657 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_49655 ?auto_49660 ) ( IS-CRATE ?auto_49653 ) ( not ( = ?auto_49652 ?auto_49653 ) ) ( not ( = ?auto_49656 ?auto_49652 ) ) ( not ( = ?auto_49656 ?auto_49653 ) ) ( not ( = ?auto_49659 ?auto_49660 ) ) ( HOIST-AT ?auto_49654 ?auto_49659 ) ( not ( = ?auto_49655 ?auto_49654 ) ) ( AVAILABLE ?auto_49654 ) ( SURFACE-AT ?auto_49653 ?auto_49659 ) ( ON ?auto_49653 ?auto_49658 ) ( CLEAR ?auto_49653 ) ( not ( = ?auto_49652 ?auto_49658 ) ) ( not ( = ?auto_49653 ?auto_49658 ) ) ( not ( = ?auto_49656 ?auto_49658 ) ) ( TRUCK-AT ?auto_49657 ?auto_49660 ) ( SURFACE-AT ?auto_49656 ?auto_49660 ) ( CLEAR ?auto_49656 ) ( IS-CRATE ?auto_49652 ) ( AVAILABLE ?auto_49655 ) ( IN ?auto_49652 ?auto_49657 ) )
    :subtasks
    ( ( !UNLOAD ?auto_49655 ?auto_49652 ?auto_49657 ?auto_49660 )
      ( MAKE-2CRATE ?auto_49656 ?auto_49652 ?auto_49653 )
      ( MAKE-1CRATE-VERIFY ?auto_49652 ?auto_49653 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_49661 - SURFACE
      ?auto_49662 - SURFACE
      ?auto_49663 - SURFACE
    )
    :vars
    (
      ?auto_49668 - HOIST
      ?auto_49665 - PLACE
      ?auto_49664 - PLACE
      ?auto_49667 - HOIST
      ?auto_49666 - SURFACE
      ?auto_49669 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_49668 ?auto_49665 ) ( IS-CRATE ?auto_49663 ) ( not ( = ?auto_49662 ?auto_49663 ) ) ( not ( = ?auto_49661 ?auto_49662 ) ) ( not ( = ?auto_49661 ?auto_49663 ) ) ( not ( = ?auto_49664 ?auto_49665 ) ) ( HOIST-AT ?auto_49667 ?auto_49664 ) ( not ( = ?auto_49668 ?auto_49667 ) ) ( AVAILABLE ?auto_49667 ) ( SURFACE-AT ?auto_49663 ?auto_49664 ) ( ON ?auto_49663 ?auto_49666 ) ( CLEAR ?auto_49663 ) ( not ( = ?auto_49662 ?auto_49666 ) ) ( not ( = ?auto_49663 ?auto_49666 ) ) ( not ( = ?auto_49661 ?auto_49666 ) ) ( TRUCK-AT ?auto_49669 ?auto_49665 ) ( SURFACE-AT ?auto_49661 ?auto_49665 ) ( CLEAR ?auto_49661 ) ( IS-CRATE ?auto_49662 ) ( AVAILABLE ?auto_49668 ) ( IN ?auto_49662 ?auto_49669 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_49662 ?auto_49663 )
      ( MAKE-2CRATE-VERIFY ?auto_49661 ?auto_49662 ?auto_49663 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_49706 - SURFACE
      ?auto_49707 - SURFACE
    )
    :vars
    (
      ?auto_49714 - HOIST
      ?auto_49711 - PLACE
      ?auto_49713 - SURFACE
      ?auto_49712 - PLACE
      ?auto_49710 - HOIST
      ?auto_49708 - SURFACE
      ?auto_49709 - TRUCK
      ?auto_49715 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_49714 ?auto_49711 ) ( SURFACE-AT ?auto_49706 ?auto_49711 ) ( CLEAR ?auto_49706 ) ( IS-CRATE ?auto_49707 ) ( not ( = ?auto_49706 ?auto_49707 ) ) ( AVAILABLE ?auto_49714 ) ( ON ?auto_49706 ?auto_49713 ) ( not ( = ?auto_49713 ?auto_49706 ) ) ( not ( = ?auto_49713 ?auto_49707 ) ) ( not ( = ?auto_49712 ?auto_49711 ) ) ( HOIST-AT ?auto_49710 ?auto_49712 ) ( not ( = ?auto_49714 ?auto_49710 ) ) ( AVAILABLE ?auto_49710 ) ( SURFACE-AT ?auto_49707 ?auto_49712 ) ( ON ?auto_49707 ?auto_49708 ) ( CLEAR ?auto_49707 ) ( not ( = ?auto_49706 ?auto_49708 ) ) ( not ( = ?auto_49707 ?auto_49708 ) ) ( not ( = ?auto_49713 ?auto_49708 ) ) ( TRUCK-AT ?auto_49709 ?auto_49715 ) ( not ( = ?auto_49715 ?auto_49711 ) ) ( not ( = ?auto_49712 ?auto_49715 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_49709 ?auto_49715 ?auto_49711 )
      ( MAKE-1CRATE ?auto_49706 ?auto_49707 )
      ( MAKE-1CRATE-VERIFY ?auto_49706 ?auto_49707 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_49745 - SURFACE
      ?auto_49746 - SURFACE
      ?auto_49747 - SURFACE
      ?auto_49748 - SURFACE
    )
    :vars
    (
      ?auto_49750 - HOIST
      ?auto_49749 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_49750 ?auto_49749 ) ( SURFACE-AT ?auto_49747 ?auto_49749 ) ( CLEAR ?auto_49747 ) ( LIFTING ?auto_49750 ?auto_49748 ) ( IS-CRATE ?auto_49748 ) ( not ( = ?auto_49747 ?auto_49748 ) ) ( ON ?auto_49746 ?auto_49745 ) ( ON ?auto_49747 ?auto_49746 ) ( not ( = ?auto_49745 ?auto_49746 ) ) ( not ( = ?auto_49745 ?auto_49747 ) ) ( not ( = ?auto_49745 ?auto_49748 ) ) ( not ( = ?auto_49746 ?auto_49747 ) ) ( not ( = ?auto_49746 ?auto_49748 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_49747 ?auto_49748 )
      ( MAKE-3CRATE-VERIFY ?auto_49745 ?auto_49746 ?auto_49747 ?auto_49748 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_49762 - SURFACE
      ?auto_49763 - SURFACE
      ?auto_49764 - SURFACE
      ?auto_49765 - SURFACE
    )
    :vars
    (
      ?auto_49766 - HOIST
      ?auto_49767 - PLACE
      ?auto_49768 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_49766 ?auto_49767 ) ( SURFACE-AT ?auto_49764 ?auto_49767 ) ( CLEAR ?auto_49764 ) ( IS-CRATE ?auto_49765 ) ( not ( = ?auto_49764 ?auto_49765 ) ) ( TRUCK-AT ?auto_49768 ?auto_49767 ) ( AVAILABLE ?auto_49766 ) ( IN ?auto_49765 ?auto_49768 ) ( ON ?auto_49764 ?auto_49763 ) ( not ( = ?auto_49763 ?auto_49764 ) ) ( not ( = ?auto_49763 ?auto_49765 ) ) ( ON ?auto_49763 ?auto_49762 ) ( not ( = ?auto_49762 ?auto_49763 ) ) ( not ( = ?auto_49762 ?auto_49764 ) ) ( not ( = ?auto_49762 ?auto_49765 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_49763 ?auto_49764 ?auto_49765 )
      ( MAKE-3CRATE-VERIFY ?auto_49762 ?auto_49763 ?auto_49764 ?auto_49765 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_49783 - SURFACE
      ?auto_49784 - SURFACE
      ?auto_49785 - SURFACE
      ?auto_49786 - SURFACE
    )
    :vars
    (
      ?auto_49787 - HOIST
      ?auto_49790 - PLACE
      ?auto_49788 - TRUCK
      ?auto_49789 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_49787 ?auto_49790 ) ( SURFACE-AT ?auto_49785 ?auto_49790 ) ( CLEAR ?auto_49785 ) ( IS-CRATE ?auto_49786 ) ( not ( = ?auto_49785 ?auto_49786 ) ) ( AVAILABLE ?auto_49787 ) ( IN ?auto_49786 ?auto_49788 ) ( ON ?auto_49785 ?auto_49784 ) ( not ( = ?auto_49784 ?auto_49785 ) ) ( not ( = ?auto_49784 ?auto_49786 ) ) ( TRUCK-AT ?auto_49788 ?auto_49789 ) ( not ( = ?auto_49789 ?auto_49790 ) ) ( ON ?auto_49784 ?auto_49783 ) ( not ( = ?auto_49783 ?auto_49784 ) ) ( not ( = ?auto_49783 ?auto_49785 ) ) ( not ( = ?auto_49783 ?auto_49786 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_49784 ?auto_49785 ?auto_49786 )
      ( MAKE-3CRATE-VERIFY ?auto_49783 ?auto_49784 ?auto_49785 ?auto_49786 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_49807 - SURFACE
      ?auto_49808 - SURFACE
      ?auto_49809 - SURFACE
      ?auto_49810 - SURFACE
    )
    :vars
    (
      ?auto_49814 - HOIST
      ?auto_49812 - PLACE
      ?auto_49811 - TRUCK
      ?auto_49813 - PLACE
      ?auto_49815 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_49814 ?auto_49812 ) ( SURFACE-AT ?auto_49809 ?auto_49812 ) ( CLEAR ?auto_49809 ) ( IS-CRATE ?auto_49810 ) ( not ( = ?auto_49809 ?auto_49810 ) ) ( AVAILABLE ?auto_49814 ) ( ON ?auto_49809 ?auto_49808 ) ( not ( = ?auto_49808 ?auto_49809 ) ) ( not ( = ?auto_49808 ?auto_49810 ) ) ( TRUCK-AT ?auto_49811 ?auto_49813 ) ( not ( = ?auto_49813 ?auto_49812 ) ) ( HOIST-AT ?auto_49815 ?auto_49813 ) ( LIFTING ?auto_49815 ?auto_49810 ) ( not ( = ?auto_49814 ?auto_49815 ) ) ( ON ?auto_49808 ?auto_49807 ) ( not ( = ?auto_49807 ?auto_49808 ) ) ( not ( = ?auto_49807 ?auto_49809 ) ) ( not ( = ?auto_49807 ?auto_49810 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_49808 ?auto_49809 ?auto_49810 )
      ( MAKE-3CRATE-VERIFY ?auto_49807 ?auto_49808 ?auto_49809 ?auto_49810 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_49834 - SURFACE
      ?auto_49835 - SURFACE
      ?auto_49836 - SURFACE
      ?auto_49837 - SURFACE
    )
    :vars
    (
      ?auto_49842 - HOIST
      ?auto_49838 - PLACE
      ?auto_49841 - TRUCK
      ?auto_49839 - PLACE
      ?auto_49843 - HOIST
      ?auto_49840 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_49842 ?auto_49838 ) ( SURFACE-AT ?auto_49836 ?auto_49838 ) ( CLEAR ?auto_49836 ) ( IS-CRATE ?auto_49837 ) ( not ( = ?auto_49836 ?auto_49837 ) ) ( AVAILABLE ?auto_49842 ) ( ON ?auto_49836 ?auto_49835 ) ( not ( = ?auto_49835 ?auto_49836 ) ) ( not ( = ?auto_49835 ?auto_49837 ) ) ( TRUCK-AT ?auto_49841 ?auto_49839 ) ( not ( = ?auto_49839 ?auto_49838 ) ) ( HOIST-AT ?auto_49843 ?auto_49839 ) ( not ( = ?auto_49842 ?auto_49843 ) ) ( AVAILABLE ?auto_49843 ) ( SURFACE-AT ?auto_49837 ?auto_49839 ) ( ON ?auto_49837 ?auto_49840 ) ( CLEAR ?auto_49837 ) ( not ( = ?auto_49836 ?auto_49840 ) ) ( not ( = ?auto_49837 ?auto_49840 ) ) ( not ( = ?auto_49835 ?auto_49840 ) ) ( ON ?auto_49835 ?auto_49834 ) ( not ( = ?auto_49834 ?auto_49835 ) ) ( not ( = ?auto_49834 ?auto_49836 ) ) ( not ( = ?auto_49834 ?auto_49837 ) ) ( not ( = ?auto_49834 ?auto_49840 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_49835 ?auto_49836 ?auto_49837 )
      ( MAKE-3CRATE-VERIFY ?auto_49834 ?auto_49835 ?auto_49836 ?auto_49837 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_49862 - SURFACE
      ?auto_49863 - SURFACE
      ?auto_49864 - SURFACE
      ?auto_49865 - SURFACE
    )
    :vars
    (
      ?auto_49870 - HOIST
      ?auto_49867 - PLACE
      ?auto_49871 - PLACE
      ?auto_49868 - HOIST
      ?auto_49866 - SURFACE
      ?auto_49869 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_49870 ?auto_49867 ) ( SURFACE-AT ?auto_49864 ?auto_49867 ) ( CLEAR ?auto_49864 ) ( IS-CRATE ?auto_49865 ) ( not ( = ?auto_49864 ?auto_49865 ) ) ( AVAILABLE ?auto_49870 ) ( ON ?auto_49864 ?auto_49863 ) ( not ( = ?auto_49863 ?auto_49864 ) ) ( not ( = ?auto_49863 ?auto_49865 ) ) ( not ( = ?auto_49871 ?auto_49867 ) ) ( HOIST-AT ?auto_49868 ?auto_49871 ) ( not ( = ?auto_49870 ?auto_49868 ) ) ( AVAILABLE ?auto_49868 ) ( SURFACE-AT ?auto_49865 ?auto_49871 ) ( ON ?auto_49865 ?auto_49866 ) ( CLEAR ?auto_49865 ) ( not ( = ?auto_49864 ?auto_49866 ) ) ( not ( = ?auto_49865 ?auto_49866 ) ) ( not ( = ?auto_49863 ?auto_49866 ) ) ( TRUCK-AT ?auto_49869 ?auto_49867 ) ( ON ?auto_49863 ?auto_49862 ) ( not ( = ?auto_49862 ?auto_49863 ) ) ( not ( = ?auto_49862 ?auto_49864 ) ) ( not ( = ?auto_49862 ?auto_49865 ) ) ( not ( = ?auto_49862 ?auto_49866 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_49863 ?auto_49864 ?auto_49865 )
      ( MAKE-3CRATE-VERIFY ?auto_49862 ?auto_49863 ?auto_49864 ?auto_49865 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_49890 - SURFACE
      ?auto_49891 - SURFACE
      ?auto_49892 - SURFACE
      ?auto_49893 - SURFACE
    )
    :vars
    (
      ?auto_49897 - HOIST
      ?auto_49898 - PLACE
      ?auto_49896 - PLACE
      ?auto_49899 - HOIST
      ?auto_49895 - SURFACE
      ?auto_49894 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_49897 ?auto_49898 ) ( IS-CRATE ?auto_49893 ) ( not ( = ?auto_49892 ?auto_49893 ) ) ( not ( = ?auto_49891 ?auto_49892 ) ) ( not ( = ?auto_49891 ?auto_49893 ) ) ( not ( = ?auto_49896 ?auto_49898 ) ) ( HOIST-AT ?auto_49899 ?auto_49896 ) ( not ( = ?auto_49897 ?auto_49899 ) ) ( AVAILABLE ?auto_49899 ) ( SURFACE-AT ?auto_49893 ?auto_49896 ) ( ON ?auto_49893 ?auto_49895 ) ( CLEAR ?auto_49893 ) ( not ( = ?auto_49892 ?auto_49895 ) ) ( not ( = ?auto_49893 ?auto_49895 ) ) ( not ( = ?auto_49891 ?auto_49895 ) ) ( TRUCK-AT ?auto_49894 ?auto_49898 ) ( SURFACE-AT ?auto_49891 ?auto_49898 ) ( CLEAR ?auto_49891 ) ( LIFTING ?auto_49897 ?auto_49892 ) ( IS-CRATE ?auto_49892 ) ( ON ?auto_49891 ?auto_49890 ) ( not ( = ?auto_49890 ?auto_49891 ) ) ( not ( = ?auto_49890 ?auto_49892 ) ) ( not ( = ?auto_49890 ?auto_49893 ) ) ( not ( = ?auto_49890 ?auto_49895 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_49891 ?auto_49892 ?auto_49893 )
      ( MAKE-3CRATE-VERIFY ?auto_49890 ?auto_49891 ?auto_49892 ?auto_49893 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_49918 - SURFACE
      ?auto_49919 - SURFACE
      ?auto_49920 - SURFACE
      ?auto_49921 - SURFACE
    )
    :vars
    (
      ?auto_49924 - HOIST
      ?auto_49925 - PLACE
      ?auto_49926 - PLACE
      ?auto_49927 - HOIST
      ?auto_49922 - SURFACE
      ?auto_49923 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_49924 ?auto_49925 ) ( IS-CRATE ?auto_49921 ) ( not ( = ?auto_49920 ?auto_49921 ) ) ( not ( = ?auto_49919 ?auto_49920 ) ) ( not ( = ?auto_49919 ?auto_49921 ) ) ( not ( = ?auto_49926 ?auto_49925 ) ) ( HOIST-AT ?auto_49927 ?auto_49926 ) ( not ( = ?auto_49924 ?auto_49927 ) ) ( AVAILABLE ?auto_49927 ) ( SURFACE-AT ?auto_49921 ?auto_49926 ) ( ON ?auto_49921 ?auto_49922 ) ( CLEAR ?auto_49921 ) ( not ( = ?auto_49920 ?auto_49922 ) ) ( not ( = ?auto_49921 ?auto_49922 ) ) ( not ( = ?auto_49919 ?auto_49922 ) ) ( TRUCK-AT ?auto_49923 ?auto_49925 ) ( SURFACE-AT ?auto_49919 ?auto_49925 ) ( CLEAR ?auto_49919 ) ( IS-CRATE ?auto_49920 ) ( AVAILABLE ?auto_49924 ) ( IN ?auto_49920 ?auto_49923 ) ( ON ?auto_49919 ?auto_49918 ) ( not ( = ?auto_49918 ?auto_49919 ) ) ( not ( = ?auto_49918 ?auto_49920 ) ) ( not ( = ?auto_49918 ?auto_49921 ) ) ( not ( = ?auto_49918 ?auto_49922 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_49919 ?auto_49920 ?auto_49921 )
      ( MAKE-3CRATE-VERIFY ?auto_49918 ?auto_49919 ?auto_49920 ?auto_49921 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_49928 - SURFACE
      ?auto_49929 - SURFACE
    )
    :vars
    (
      ?auto_49933 - HOIST
      ?auto_49934 - PLACE
      ?auto_49931 - SURFACE
      ?auto_49935 - PLACE
      ?auto_49936 - HOIST
      ?auto_49930 - SURFACE
      ?auto_49932 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_49933 ?auto_49934 ) ( IS-CRATE ?auto_49929 ) ( not ( = ?auto_49928 ?auto_49929 ) ) ( not ( = ?auto_49931 ?auto_49928 ) ) ( not ( = ?auto_49931 ?auto_49929 ) ) ( not ( = ?auto_49935 ?auto_49934 ) ) ( HOIST-AT ?auto_49936 ?auto_49935 ) ( not ( = ?auto_49933 ?auto_49936 ) ) ( AVAILABLE ?auto_49936 ) ( SURFACE-AT ?auto_49929 ?auto_49935 ) ( ON ?auto_49929 ?auto_49930 ) ( CLEAR ?auto_49929 ) ( not ( = ?auto_49928 ?auto_49930 ) ) ( not ( = ?auto_49929 ?auto_49930 ) ) ( not ( = ?auto_49931 ?auto_49930 ) ) ( SURFACE-AT ?auto_49931 ?auto_49934 ) ( CLEAR ?auto_49931 ) ( IS-CRATE ?auto_49928 ) ( AVAILABLE ?auto_49933 ) ( IN ?auto_49928 ?auto_49932 ) ( TRUCK-AT ?auto_49932 ?auto_49935 ) )
    :subtasks
    ( ( !DRIVE ?auto_49932 ?auto_49935 ?auto_49934 )
      ( MAKE-2CRATE ?auto_49931 ?auto_49928 ?auto_49929 )
      ( MAKE-1CRATE-VERIFY ?auto_49928 ?auto_49929 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_49937 - SURFACE
      ?auto_49938 - SURFACE
      ?auto_49939 - SURFACE
    )
    :vars
    (
      ?auto_49944 - HOIST
      ?auto_49945 - PLACE
      ?auto_49940 - PLACE
      ?auto_49943 - HOIST
      ?auto_49942 - SURFACE
      ?auto_49941 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_49944 ?auto_49945 ) ( IS-CRATE ?auto_49939 ) ( not ( = ?auto_49938 ?auto_49939 ) ) ( not ( = ?auto_49937 ?auto_49938 ) ) ( not ( = ?auto_49937 ?auto_49939 ) ) ( not ( = ?auto_49940 ?auto_49945 ) ) ( HOIST-AT ?auto_49943 ?auto_49940 ) ( not ( = ?auto_49944 ?auto_49943 ) ) ( AVAILABLE ?auto_49943 ) ( SURFACE-AT ?auto_49939 ?auto_49940 ) ( ON ?auto_49939 ?auto_49942 ) ( CLEAR ?auto_49939 ) ( not ( = ?auto_49938 ?auto_49942 ) ) ( not ( = ?auto_49939 ?auto_49942 ) ) ( not ( = ?auto_49937 ?auto_49942 ) ) ( SURFACE-AT ?auto_49937 ?auto_49945 ) ( CLEAR ?auto_49937 ) ( IS-CRATE ?auto_49938 ) ( AVAILABLE ?auto_49944 ) ( IN ?auto_49938 ?auto_49941 ) ( TRUCK-AT ?auto_49941 ?auto_49940 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_49938 ?auto_49939 )
      ( MAKE-2CRATE-VERIFY ?auto_49937 ?auto_49938 ?auto_49939 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_49946 - SURFACE
      ?auto_49947 - SURFACE
      ?auto_49948 - SURFACE
      ?auto_49949 - SURFACE
    )
    :vars
    (
      ?auto_49954 - HOIST
      ?auto_49953 - PLACE
      ?auto_49951 - PLACE
      ?auto_49952 - HOIST
      ?auto_49955 - SURFACE
      ?auto_49950 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_49954 ?auto_49953 ) ( IS-CRATE ?auto_49949 ) ( not ( = ?auto_49948 ?auto_49949 ) ) ( not ( = ?auto_49947 ?auto_49948 ) ) ( not ( = ?auto_49947 ?auto_49949 ) ) ( not ( = ?auto_49951 ?auto_49953 ) ) ( HOIST-AT ?auto_49952 ?auto_49951 ) ( not ( = ?auto_49954 ?auto_49952 ) ) ( AVAILABLE ?auto_49952 ) ( SURFACE-AT ?auto_49949 ?auto_49951 ) ( ON ?auto_49949 ?auto_49955 ) ( CLEAR ?auto_49949 ) ( not ( = ?auto_49948 ?auto_49955 ) ) ( not ( = ?auto_49949 ?auto_49955 ) ) ( not ( = ?auto_49947 ?auto_49955 ) ) ( SURFACE-AT ?auto_49947 ?auto_49953 ) ( CLEAR ?auto_49947 ) ( IS-CRATE ?auto_49948 ) ( AVAILABLE ?auto_49954 ) ( IN ?auto_49948 ?auto_49950 ) ( TRUCK-AT ?auto_49950 ?auto_49951 ) ( ON ?auto_49947 ?auto_49946 ) ( not ( = ?auto_49946 ?auto_49947 ) ) ( not ( = ?auto_49946 ?auto_49948 ) ) ( not ( = ?auto_49946 ?auto_49949 ) ) ( not ( = ?auto_49946 ?auto_49955 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_49947 ?auto_49948 ?auto_49949 )
      ( MAKE-3CRATE-VERIFY ?auto_49946 ?auto_49947 ?auto_49948 ?auto_49949 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_49956 - SURFACE
      ?auto_49957 - SURFACE
    )
    :vars
    (
      ?auto_49962 - HOIST
      ?auto_49961 - PLACE
      ?auto_49964 - SURFACE
      ?auto_49959 - PLACE
      ?auto_49960 - HOIST
      ?auto_49963 - SURFACE
      ?auto_49958 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_49962 ?auto_49961 ) ( IS-CRATE ?auto_49957 ) ( not ( = ?auto_49956 ?auto_49957 ) ) ( not ( = ?auto_49964 ?auto_49956 ) ) ( not ( = ?auto_49964 ?auto_49957 ) ) ( not ( = ?auto_49959 ?auto_49961 ) ) ( HOIST-AT ?auto_49960 ?auto_49959 ) ( not ( = ?auto_49962 ?auto_49960 ) ) ( SURFACE-AT ?auto_49957 ?auto_49959 ) ( ON ?auto_49957 ?auto_49963 ) ( CLEAR ?auto_49957 ) ( not ( = ?auto_49956 ?auto_49963 ) ) ( not ( = ?auto_49957 ?auto_49963 ) ) ( not ( = ?auto_49964 ?auto_49963 ) ) ( SURFACE-AT ?auto_49964 ?auto_49961 ) ( CLEAR ?auto_49964 ) ( IS-CRATE ?auto_49956 ) ( AVAILABLE ?auto_49962 ) ( TRUCK-AT ?auto_49958 ?auto_49959 ) ( LIFTING ?auto_49960 ?auto_49956 ) )
    :subtasks
    ( ( !LOAD ?auto_49960 ?auto_49956 ?auto_49958 ?auto_49959 )
      ( MAKE-2CRATE ?auto_49964 ?auto_49956 ?auto_49957 )
      ( MAKE-1CRATE-VERIFY ?auto_49956 ?auto_49957 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_49965 - SURFACE
      ?auto_49966 - SURFACE
      ?auto_49967 - SURFACE
    )
    :vars
    (
      ?auto_49973 - HOIST
      ?auto_49970 - PLACE
      ?auto_49968 - PLACE
      ?auto_49971 - HOIST
      ?auto_49972 - SURFACE
      ?auto_49969 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_49973 ?auto_49970 ) ( IS-CRATE ?auto_49967 ) ( not ( = ?auto_49966 ?auto_49967 ) ) ( not ( = ?auto_49965 ?auto_49966 ) ) ( not ( = ?auto_49965 ?auto_49967 ) ) ( not ( = ?auto_49968 ?auto_49970 ) ) ( HOIST-AT ?auto_49971 ?auto_49968 ) ( not ( = ?auto_49973 ?auto_49971 ) ) ( SURFACE-AT ?auto_49967 ?auto_49968 ) ( ON ?auto_49967 ?auto_49972 ) ( CLEAR ?auto_49967 ) ( not ( = ?auto_49966 ?auto_49972 ) ) ( not ( = ?auto_49967 ?auto_49972 ) ) ( not ( = ?auto_49965 ?auto_49972 ) ) ( SURFACE-AT ?auto_49965 ?auto_49970 ) ( CLEAR ?auto_49965 ) ( IS-CRATE ?auto_49966 ) ( AVAILABLE ?auto_49973 ) ( TRUCK-AT ?auto_49969 ?auto_49968 ) ( LIFTING ?auto_49971 ?auto_49966 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_49966 ?auto_49967 )
      ( MAKE-2CRATE-VERIFY ?auto_49965 ?auto_49966 ?auto_49967 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_49974 - SURFACE
      ?auto_49975 - SURFACE
      ?auto_49976 - SURFACE
      ?auto_49977 - SURFACE
    )
    :vars
    (
      ?auto_49980 - HOIST
      ?auto_49982 - PLACE
      ?auto_49978 - PLACE
      ?auto_49979 - HOIST
      ?auto_49981 - SURFACE
      ?auto_49983 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_49980 ?auto_49982 ) ( IS-CRATE ?auto_49977 ) ( not ( = ?auto_49976 ?auto_49977 ) ) ( not ( = ?auto_49975 ?auto_49976 ) ) ( not ( = ?auto_49975 ?auto_49977 ) ) ( not ( = ?auto_49978 ?auto_49982 ) ) ( HOIST-AT ?auto_49979 ?auto_49978 ) ( not ( = ?auto_49980 ?auto_49979 ) ) ( SURFACE-AT ?auto_49977 ?auto_49978 ) ( ON ?auto_49977 ?auto_49981 ) ( CLEAR ?auto_49977 ) ( not ( = ?auto_49976 ?auto_49981 ) ) ( not ( = ?auto_49977 ?auto_49981 ) ) ( not ( = ?auto_49975 ?auto_49981 ) ) ( SURFACE-AT ?auto_49975 ?auto_49982 ) ( CLEAR ?auto_49975 ) ( IS-CRATE ?auto_49976 ) ( AVAILABLE ?auto_49980 ) ( TRUCK-AT ?auto_49983 ?auto_49978 ) ( LIFTING ?auto_49979 ?auto_49976 ) ( ON ?auto_49975 ?auto_49974 ) ( not ( = ?auto_49974 ?auto_49975 ) ) ( not ( = ?auto_49974 ?auto_49976 ) ) ( not ( = ?auto_49974 ?auto_49977 ) ) ( not ( = ?auto_49974 ?auto_49981 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_49975 ?auto_49976 ?auto_49977 )
      ( MAKE-3CRATE-VERIFY ?auto_49974 ?auto_49975 ?auto_49976 ?auto_49977 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_49984 - SURFACE
      ?auto_49985 - SURFACE
    )
    :vars
    (
      ?auto_49988 - HOIST
      ?auto_49991 - PLACE
      ?auto_49989 - SURFACE
      ?auto_49986 - PLACE
      ?auto_49987 - HOIST
      ?auto_49990 - SURFACE
      ?auto_49992 - TRUCK
      ?auto_49993 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_49988 ?auto_49991 ) ( IS-CRATE ?auto_49985 ) ( not ( = ?auto_49984 ?auto_49985 ) ) ( not ( = ?auto_49989 ?auto_49984 ) ) ( not ( = ?auto_49989 ?auto_49985 ) ) ( not ( = ?auto_49986 ?auto_49991 ) ) ( HOIST-AT ?auto_49987 ?auto_49986 ) ( not ( = ?auto_49988 ?auto_49987 ) ) ( SURFACE-AT ?auto_49985 ?auto_49986 ) ( ON ?auto_49985 ?auto_49990 ) ( CLEAR ?auto_49985 ) ( not ( = ?auto_49984 ?auto_49990 ) ) ( not ( = ?auto_49985 ?auto_49990 ) ) ( not ( = ?auto_49989 ?auto_49990 ) ) ( SURFACE-AT ?auto_49989 ?auto_49991 ) ( CLEAR ?auto_49989 ) ( IS-CRATE ?auto_49984 ) ( AVAILABLE ?auto_49988 ) ( TRUCK-AT ?auto_49992 ?auto_49986 ) ( AVAILABLE ?auto_49987 ) ( SURFACE-AT ?auto_49984 ?auto_49986 ) ( ON ?auto_49984 ?auto_49993 ) ( CLEAR ?auto_49984 ) ( not ( = ?auto_49984 ?auto_49993 ) ) ( not ( = ?auto_49985 ?auto_49993 ) ) ( not ( = ?auto_49989 ?auto_49993 ) ) ( not ( = ?auto_49990 ?auto_49993 ) ) )
    :subtasks
    ( ( !LIFT ?auto_49987 ?auto_49984 ?auto_49993 ?auto_49986 )
      ( MAKE-2CRATE ?auto_49989 ?auto_49984 ?auto_49985 )
      ( MAKE-1CRATE-VERIFY ?auto_49984 ?auto_49985 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_49994 - SURFACE
      ?auto_49995 - SURFACE
      ?auto_49996 - SURFACE
    )
    :vars
    (
      ?auto_50003 - HOIST
      ?auto_49998 - PLACE
      ?auto_50000 - PLACE
      ?auto_50002 - HOIST
      ?auto_49997 - SURFACE
      ?auto_50001 - TRUCK
      ?auto_49999 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_50003 ?auto_49998 ) ( IS-CRATE ?auto_49996 ) ( not ( = ?auto_49995 ?auto_49996 ) ) ( not ( = ?auto_49994 ?auto_49995 ) ) ( not ( = ?auto_49994 ?auto_49996 ) ) ( not ( = ?auto_50000 ?auto_49998 ) ) ( HOIST-AT ?auto_50002 ?auto_50000 ) ( not ( = ?auto_50003 ?auto_50002 ) ) ( SURFACE-AT ?auto_49996 ?auto_50000 ) ( ON ?auto_49996 ?auto_49997 ) ( CLEAR ?auto_49996 ) ( not ( = ?auto_49995 ?auto_49997 ) ) ( not ( = ?auto_49996 ?auto_49997 ) ) ( not ( = ?auto_49994 ?auto_49997 ) ) ( SURFACE-AT ?auto_49994 ?auto_49998 ) ( CLEAR ?auto_49994 ) ( IS-CRATE ?auto_49995 ) ( AVAILABLE ?auto_50003 ) ( TRUCK-AT ?auto_50001 ?auto_50000 ) ( AVAILABLE ?auto_50002 ) ( SURFACE-AT ?auto_49995 ?auto_50000 ) ( ON ?auto_49995 ?auto_49999 ) ( CLEAR ?auto_49995 ) ( not ( = ?auto_49995 ?auto_49999 ) ) ( not ( = ?auto_49996 ?auto_49999 ) ) ( not ( = ?auto_49994 ?auto_49999 ) ) ( not ( = ?auto_49997 ?auto_49999 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_49995 ?auto_49996 )
      ( MAKE-2CRATE-VERIFY ?auto_49994 ?auto_49995 ?auto_49996 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_50004 - SURFACE
      ?auto_50005 - SURFACE
      ?auto_50006 - SURFACE
      ?auto_50007 - SURFACE
    )
    :vars
    (
      ?auto_50008 - HOIST
      ?auto_50014 - PLACE
      ?auto_50010 - PLACE
      ?auto_50009 - HOIST
      ?auto_50012 - SURFACE
      ?auto_50013 - TRUCK
      ?auto_50011 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_50008 ?auto_50014 ) ( IS-CRATE ?auto_50007 ) ( not ( = ?auto_50006 ?auto_50007 ) ) ( not ( = ?auto_50005 ?auto_50006 ) ) ( not ( = ?auto_50005 ?auto_50007 ) ) ( not ( = ?auto_50010 ?auto_50014 ) ) ( HOIST-AT ?auto_50009 ?auto_50010 ) ( not ( = ?auto_50008 ?auto_50009 ) ) ( SURFACE-AT ?auto_50007 ?auto_50010 ) ( ON ?auto_50007 ?auto_50012 ) ( CLEAR ?auto_50007 ) ( not ( = ?auto_50006 ?auto_50012 ) ) ( not ( = ?auto_50007 ?auto_50012 ) ) ( not ( = ?auto_50005 ?auto_50012 ) ) ( SURFACE-AT ?auto_50005 ?auto_50014 ) ( CLEAR ?auto_50005 ) ( IS-CRATE ?auto_50006 ) ( AVAILABLE ?auto_50008 ) ( TRUCK-AT ?auto_50013 ?auto_50010 ) ( AVAILABLE ?auto_50009 ) ( SURFACE-AT ?auto_50006 ?auto_50010 ) ( ON ?auto_50006 ?auto_50011 ) ( CLEAR ?auto_50006 ) ( not ( = ?auto_50006 ?auto_50011 ) ) ( not ( = ?auto_50007 ?auto_50011 ) ) ( not ( = ?auto_50005 ?auto_50011 ) ) ( not ( = ?auto_50012 ?auto_50011 ) ) ( ON ?auto_50005 ?auto_50004 ) ( not ( = ?auto_50004 ?auto_50005 ) ) ( not ( = ?auto_50004 ?auto_50006 ) ) ( not ( = ?auto_50004 ?auto_50007 ) ) ( not ( = ?auto_50004 ?auto_50012 ) ) ( not ( = ?auto_50004 ?auto_50011 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_50005 ?auto_50006 ?auto_50007 )
      ( MAKE-3CRATE-VERIFY ?auto_50004 ?auto_50005 ?auto_50006 ?auto_50007 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_50015 - SURFACE
      ?auto_50016 - SURFACE
    )
    :vars
    (
      ?auto_50017 - HOIST
      ?auto_50024 - PLACE
      ?auto_50019 - SURFACE
      ?auto_50020 - PLACE
      ?auto_50018 - HOIST
      ?auto_50022 - SURFACE
      ?auto_50021 - SURFACE
      ?auto_50023 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_50017 ?auto_50024 ) ( IS-CRATE ?auto_50016 ) ( not ( = ?auto_50015 ?auto_50016 ) ) ( not ( = ?auto_50019 ?auto_50015 ) ) ( not ( = ?auto_50019 ?auto_50016 ) ) ( not ( = ?auto_50020 ?auto_50024 ) ) ( HOIST-AT ?auto_50018 ?auto_50020 ) ( not ( = ?auto_50017 ?auto_50018 ) ) ( SURFACE-AT ?auto_50016 ?auto_50020 ) ( ON ?auto_50016 ?auto_50022 ) ( CLEAR ?auto_50016 ) ( not ( = ?auto_50015 ?auto_50022 ) ) ( not ( = ?auto_50016 ?auto_50022 ) ) ( not ( = ?auto_50019 ?auto_50022 ) ) ( SURFACE-AT ?auto_50019 ?auto_50024 ) ( CLEAR ?auto_50019 ) ( IS-CRATE ?auto_50015 ) ( AVAILABLE ?auto_50017 ) ( AVAILABLE ?auto_50018 ) ( SURFACE-AT ?auto_50015 ?auto_50020 ) ( ON ?auto_50015 ?auto_50021 ) ( CLEAR ?auto_50015 ) ( not ( = ?auto_50015 ?auto_50021 ) ) ( not ( = ?auto_50016 ?auto_50021 ) ) ( not ( = ?auto_50019 ?auto_50021 ) ) ( not ( = ?auto_50022 ?auto_50021 ) ) ( TRUCK-AT ?auto_50023 ?auto_50024 ) )
    :subtasks
    ( ( !DRIVE ?auto_50023 ?auto_50024 ?auto_50020 )
      ( MAKE-2CRATE ?auto_50019 ?auto_50015 ?auto_50016 )
      ( MAKE-1CRATE-VERIFY ?auto_50015 ?auto_50016 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_50025 - SURFACE
      ?auto_50026 - SURFACE
      ?auto_50027 - SURFACE
    )
    :vars
    (
      ?auto_50028 - HOIST
      ?auto_50033 - PLACE
      ?auto_50031 - PLACE
      ?auto_50032 - HOIST
      ?auto_50030 - SURFACE
      ?auto_50034 - SURFACE
      ?auto_50029 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_50028 ?auto_50033 ) ( IS-CRATE ?auto_50027 ) ( not ( = ?auto_50026 ?auto_50027 ) ) ( not ( = ?auto_50025 ?auto_50026 ) ) ( not ( = ?auto_50025 ?auto_50027 ) ) ( not ( = ?auto_50031 ?auto_50033 ) ) ( HOIST-AT ?auto_50032 ?auto_50031 ) ( not ( = ?auto_50028 ?auto_50032 ) ) ( SURFACE-AT ?auto_50027 ?auto_50031 ) ( ON ?auto_50027 ?auto_50030 ) ( CLEAR ?auto_50027 ) ( not ( = ?auto_50026 ?auto_50030 ) ) ( not ( = ?auto_50027 ?auto_50030 ) ) ( not ( = ?auto_50025 ?auto_50030 ) ) ( SURFACE-AT ?auto_50025 ?auto_50033 ) ( CLEAR ?auto_50025 ) ( IS-CRATE ?auto_50026 ) ( AVAILABLE ?auto_50028 ) ( AVAILABLE ?auto_50032 ) ( SURFACE-AT ?auto_50026 ?auto_50031 ) ( ON ?auto_50026 ?auto_50034 ) ( CLEAR ?auto_50026 ) ( not ( = ?auto_50026 ?auto_50034 ) ) ( not ( = ?auto_50027 ?auto_50034 ) ) ( not ( = ?auto_50025 ?auto_50034 ) ) ( not ( = ?auto_50030 ?auto_50034 ) ) ( TRUCK-AT ?auto_50029 ?auto_50033 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_50026 ?auto_50027 )
      ( MAKE-2CRATE-VERIFY ?auto_50025 ?auto_50026 ?auto_50027 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_50035 - SURFACE
      ?auto_50036 - SURFACE
      ?auto_50037 - SURFACE
      ?auto_50038 - SURFACE
    )
    :vars
    (
      ?auto_50040 - HOIST
      ?auto_50041 - PLACE
      ?auto_50045 - PLACE
      ?auto_50044 - HOIST
      ?auto_50039 - SURFACE
      ?auto_50042 - SURFACE
      ?auto_50043 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_50040 ?auto_50041 ) ( IS-CRATE ?auto_50038 ) ( not ( = ?auto_50037 ?auto_50038 ) ) ( not ( = ?auto_50036 ?auto_50037 ) ) ( not ( = ?auto_50036 ?auto_50038 ) ) ( not ( = ?auto_50045 ?auto_50041 ) ) ( HOIST-AT ?auto_50044 ?auto_50045 ) ( not ( = ?auto_50040 ?auto_50044 ) ) ( SURFACE-AT ?auto_50038 ?auto_50045 ) ( ON ?auto_50038 ?auto_50039 ) ( CLEAR ?auto_50038 ) ( not ( = ?auto_50037 ?auto_50039 ) ) ( not ( = ?auto_50038 ?auto_50039 ) ) ( not ( = ?auto_50036 ?auto_50039 ) ) ( SURFACE-AT ?auto_50036 ?auto_50041 ) ( CLEAR ?auto_50036 ) ( IS-CRATE ?auto_50037 ) ( AVAILABLE ?auto_50040 ) ( AVAILABLE ?auto_50044 ) ( SURFACE-AT ?auto_50037 ?auto_50045 ) ( ON ?auto_50037 ?auto_50042 ) ( CLEAR ?auto_50037 ) ( not ( = ?auto_50037 ?auto_50042 ) ) ( not ( = ?auto_50038 ?auto_50042 ) ) ( not ( = ?auto_50036 ?auto_50042 ) ) ( not ( = ?auto_50039 ?auto_50042 ) ) ( TRUCK-AT ?auto_50043 ?auto_50041 ) ( ON ?auto_50036 ?auto_50035 ) ( not ( = ?auto_50035 ?auto_50036 ) ) ( not ( = ?auto_50035 ?auto_50037 ) ) ( not ( = ?auto_50035 ?auto_50038 ) ) ( not ( = ?auto_50035 ?auto_50039 ) ) ( not ( = ?auto_50035 ?auto_50042 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_50036 ?auto_50037 ?auto_50038 )
      ( MAKE-3CRATE-VERIFY ?auto_50035 ?auto_50036 ?auto_50037 ?auto_50038 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_50046 - SURFACE
      ?auto_50047 - SURFACE
    )
    :vars
    (
      ?auto_50050 - HOIST
      ?auto_50051 - PLACE
      ?auto_50049 - SURFACE
      ?auto_50055 - PLACE
      ?auto_50054 - HOIST
      ?auto_50048 - SURFACE
      ?auto_50052 - SURFACE
      ?auto_50053 - TRUCK
      ?auto_50056 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_50050 ?auto_50051 ) ( IS-CRATE ?auto_50047 ) ( not ( = ?auto_50046 ?auto_50047 ) ) ( not ( = ?auto_50049 ?auto_50046 ) ) ( not ( = ?auto_50049 ?auto_50047 ) ) ( not ( = ?auto_50055 ?auto_50051 ) ) ( HOIST-AT ?auto_50054 ?auto_50055 ) ( not ( = ?auto_50050 ?auto_50054 ) ) ( SURFACE-AT ?auto_50047 ?auto_50055 ) ( ON ?auto_50047 ?auto_50048 ) ( CLEAR ?auto_50047 ) ( not ( = ?auto_50046 ?auto_50048 ) ) ( not ( = ?auto_50047 ?auto_50048 ) ) ( not ( = ?auto_50049 ?auto_50048 ) ) ( IS-CRATE ?auto_50046 ) ( AVAILABLE ?auto_50054 ) ( SURFACE-AT ?auto_50046 ?auto_50055 ) ( ON ?auto_50046 ?auto_50052 ) ( CLEAR ?auto_50046 ) ( not ( = ?auto_50046 ?auto_50052 ) ) ( not ( = ?auto_50047 ?auto_50052 ) ) ( not ( = ?auto_50049 ?auto_50052 ) ) ( not ( = ?auto_50048 ?auto_50052 ) ) ( TRUCK-AT ?auto_50053 ?auto_50051 ) ( SURFACE-AT ?auto_50056 ?auto_50051 ) ( CLEAR ?auto_50056 ) ( LIFTING ?auto_50050 ?auto_50049 ) ( IS-CRATE ?auto_50049 ) ( not ( = ?auto_50056 ?auto_50049 ) ) ( not ( = ?auto_50046 ?auto_50056 ) ) ( not ( = ?auto_50047 ?auto_50056 ) ) ( not ( = ?auto_50048 ?auto_50056 ) ) ( not ( = ?auto_50052 ?auto_50056 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_50056 ?auto_50049 )
      ( MAKE-2CRATE ?auto_50049 ?auto_50046 ?auto_50047 )
      ( MAKE-1CRATE-VERIFY ?auto_50046 ?auto_50047 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_50057 - SURFACE
      ?auto_50058 - SURFACE
      ?auto_50059 - SURFACE
    )
    :vars
    (
      ?auto_50064 - HOIST
      ?auto_50065 - PLACE
      ?auto_50066 - PLACE
      ?auto_50062 - HOIST
      ?auto_50061 - SURFACE
      ?auto_50060 - SURFACE
      ?auto_50063 - TRUCK
      ?auto_50067 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_50064 ?auto_50065 ) ( IS-CRATE ?auto_50059 ) ( not ( = ?auto_50058 ?auto_50059 ) ) ( not ( = ?auto_50057 ?auto_50058 ) ) ( not ( = ?auto_50057 ?auto_50059 ) ) ( not ( = ?auto_50066 ?auto_50065 ) ) ( HOIST-AT ?auto_50062 ?auto_50066 ) ( not ( = ?auto_50064 ?auto_50062 ) ) ( SURFACE-AT ?auto_50059 ?auto_50066 ) ( ON ?auto_50059 ?auto_50061 ) ( CLEAR ?auto_50059 ) ( not ( = ?auto_50058 ?auto_50061 ) ) ( not ( = ?auto_50059 ?auto_50061 ) ) ( not ( = ?auto_50057 ?auto_50061 ) ) ( IS-CRATE ?auto_50058 ) ( AVAILABLE ?auto_50062 ) ( SURFACE-AT ?auto_50058 ?auto_50066 ) ( ON ?auto_50058 ?auto_50060 ) ( CLEAR ?auto_50058 ) ( not ( = ?auto_50058 ?auto_50060 ) ) ( not ( = ?auto_50059 ?auto_50060 ) ) ( not ( = ?auto_50057 ?auto_50060 ) ) ( not ( = ?auto_50061 ?auto_50060 ) ) ( TRUCK-AT ?auto_50063 ?auto_50065 ) ( SURFACE-AT ?auto_50067 ?auto_50065 ) ( CLEAR ?auto_50067 ) ( LIFTING ?auto_50064 ?auto_50057 ) ( IS-CRATE ?auto_50057 ) ( not ( = ?auto_50067 ?auto_50057 ) ) ( not ( = ?auto_50058 ?auto_50067 ) ) ( not ( = ?auto_50059 ?auto_50067 ) ) ( not ( = ?auto_50061 ?auto_50067 ) ) ( not ( = ?auto_50060 ?auto_50067 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_50058 ?auto_50059 )
      ( MAKE-2CRATE-VERIFY ?auto_50057 ?auto_50058 ?auto_50059 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_50068 - SURFACE
      ?auto_50069 - SURFACE
      ?auto_50070 - SURFACE
      ?auto_50071 - SURFACE
    )
    :vars
    (
      ?auto_50075 - HOIST
      ?auto_50074 - PLACE
      ?auto_50073 - PLACE
      ?auto_50076 - HOIST
      ?auto_50078 - SURFACE
      ?auto_50072 - SURFACE
      ?auto_50077 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_50075 ?auto_50074 ) ( IS-CRATE ?auto_50071 ) ( not ( = ?auto_50070 ?auto_50071 ) ) ( not ( = ?auto_50069 ?auto_50070 ) ) ( not ( = ?auto_50069 ?auto_50071 ) ) ( not ( = ?auto_50073 ?auto_50074 ) ) ( HOIST-AT ?auto_50076 ?auto_50073 ) ( not ( = ?auto_50075 ?auto_50076 ) ) ( SURFACE-AT ?auto_50071 ?auto_50073 ) ( ON ?auto_50071 ?auto_50078 ) ( CLEAR ?auto_50071 ) ( not ( = ?auto_50070 ?auto_50078 ) ) ( not ( = ?auto_50071 ?auto_50078 ) ) ( not ( = ?auto_50069 ?auto_50078 ) ) ( IS-CRATE ?auto_50070 ) ( AVAILABLE ?auto_50076 ) ( SURFACE-AT ?auto_50070 ?auto_50073 ) ( ON ?auto_50070 ?auto_50072 ) ( CLEAR ?auto_50070 ) ( not ( = ?auto_50070 ?auto_50072 ) ) ( not ( = ?auto_50071 ?auto_50072 ) ) ( not ( = ?auto_50069 ?auto_50072 ) ) ( not ( = ?auto_50078 ?auto_50072 ) ) ( TRUCK-AT ?auto_50077 ?auto_50074 ) ( SURFACE-AT ?auto_50068 ?auto_50074 ) ( CLEAR ?auto_50068 ) ( LIFTING ?auto_50075 ?auto_50069 ) ( IS-CRATE ?auto_50069 ) ( not ( = ?auto_50068 ?auto_50069 ) ) ( not ( = ?auto_50070 ?auto_50068 ) ) ( not ( = ?auto_50071 ?auto_50068 ) ) ( not ( = ?auto_50078 ?auto_50068 ) ) ( not ( = ?auto_50072 ?auto_50068 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_50069 ?auto_50070 ?auto_50071 )
      ( MAKE-3CRATE-VERIFY ?auto_50068 ?auto_50069 ?auto_50070 ?auto_50071 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_50214 - SURFACE
      ?auto_50215 - SURFACE
      ?auto_50216 - SURFACE
      ?auto_50217 - SURFACE
      ?auto_50218 - SURFACE
    )
    :vars
    (
      ?auto_50220 - HOIST
      ?auto_50219 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_50220 ?auto_50219 ) ( SURFACE-AT ?auto_50217 ?auto_50219 ) ( CLEAR ?auto_50217 ) ( LIFTING ?auto_50220 ?auto_50218 ) ( IS-CRATE ?auto_50218 ) ( not ( = ?auto_50217 ?auto_50218 ) ) ( ON ?auto_50215 ?auto_50214 ) ( ON ?auto_50216 ?auto_50215 ) ( ON ?auto_50217 ?auto_50216 ) ( not ( = ?auto_50214 ?auto_50215 ) ) ( not ( = ?auto_50214 ?auto_50216 ) ) ( not ( = ?auto_50214 ?auto_50217 ) ) ( not ( = ?auto_50214 ?auto_50218 ) ) ( not ( = ?auto_50215 ?auto_50216 ) ) ( not ( = ?auto_50215 ?auto_50217 ) ) ( not ( = ?auto_50215 ?auto_50218 ) ) ( not ( = ?auto_50216 ?auto_50217 ) ) ( not ( = ?auto_50216 ?auto_50218 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_50217 ?auto_50218 )
      ( MAKE-4CRATE-VERIFY ?auto_50214 ?auto_50215 ?auto_50216 ?auto_50217 ?auto_50218 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_50239 - SURFACE
      ?auto_50240 - SURFACE
      ?auto_50241 - SURFACE
      ?auto_50242 - SURFACE
      ?auto_50243 - SURFACE
    )
    :vars
    (
      ?auto_50246 - HOIST
      ?auto_50244 - PLACE
      ?auto_50245 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_50246 ?auto_50244 ) ( SURFACE-AT ?auto_50242 ?auto_50244 ) ( CLEAR ?auto_50242 ) ( IS-CRATE ?auto_50243 ) ( not ( = ?auto_50242 ?auto_50243 ) ) ( TRUCK-AT ?auto_50245 ?auto_50244 ) ( AVAILABLE ?auto_50246 ) ( IN ?auto_50243 ?auto_50245 ) ( ON ?auto_50242 ?auto_50241 ) ( not ( = ?auto_50241 ?auto_50242 ) ) ( not ( = ?auto_50241 ?auto_50243 ) ) ( ON ?auto_50240 ?auto_50239 ) ( ON ?auto_50241 ?auto_50240 ) ( not ( = ?auto_50239 ?auto_50240 ) ) ( not ( = ?auto_50239 ?auto_50241 ) ) ( not ( = ?auto_50239 ?auto_50242 ) ) ( not ( = ?auto_50239 ?auto_50243 ) ) ( not ( = ?auto_50240 ?auto_50241 ) ) ( not ( = ?auto_50240 ?auto_50242 ) ) ( not ( = ?auto_50240 ?auto_50243 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_50241 ?auto_50242 ?auto_50243 )
      ( MAKE-4CRATE-VERIFY ?auto_50239 ?auto_50240 ?auto_50241 ?auto_50242 ?auto_50243 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_50269 - SURFACE
      ?auto_50270 - SURFACE
      ?auto_50271 - SURFACE
      ?auto_50272 - SURFACE
      ?auto_50273 - SURFACE
    )
    :vars
    (
      ?auto_50275 - HOIST
      ?auto_50277 - PLACE
      ?auto_50276 - TRUCK
      ?auto_50274 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_50275 ?auto_50277 ) ( SURFACE-AT ?auto_50272 ?auto_50277 ) ( CLEAR ?auto_50272 ) ( IS-CRATE ?auto_50273 ) ( not ( = ?auto_50272 ?auto_50273 ) ) ( AVAILABLE ?auto_50275 ) ( IN ?auto_50273 ?auto_50276 ) ( ON ?auto_50272 ?auto_50271 ) ( not ( = ?auto_50271 ?auto_50272 ) ) ( not ( = ?auto_50271 ?auto_50273 ) ) ( TRUCK-AT ?auto_50276 ?auto_50274 ) ( not ( = ?auto_50274 ?auto_50277 ) ) ( ON ?auto_50270 ?auto_50269 ) ( ON ?auto_50271 ?auto_50270 ) ( not ( = ?auto_50269 ?auto_50270 ) ) ( not ( = ?auto_50269 ?auto_50271 ) ) ( not ( = ?auto_50269 ?auto_50272 ) ) ( not ( = ?auto_50269 ?auto_50273 ) ) ( not ( = ?auto_50270 ?auto_50271 ) ) ( not ( = ?auto_50270 ?auto_50272 ) ) ( not ( = ?auto_50270 ?auto_50273 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_50271 ?auto_50272 ?auto_50273 )
      ( MAKE-4CRATE-VERIFY ?auto_50269 ?auto_50270 ?auto_50271 ?auto_50272 ?auto_50273 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_50303 - SURFACE
      ?auto_50304 - SURFACE
      ?auto_50305 - SURFACE
      ?auto_50306 - SURFACE
      ?auto_50307 - SURFACE
    )
    :vars
    (
      ?auto_50311 - HOIST
      ?auto_50308 - PLACE
      ?auto_50310 - TRUCK
      ?auto_50309 - PLACE
      ?auto_50312 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_50311 ?auto_50308 ) ( SURFACE-AT ?auto_50306 ?auto_50308 ) ( CLEAR ?auto_50306 ) ( IS-CRATE ?auto_50307 ) ( not ( = ?auto_50306 ?auto_50307 ) ) ( AVAILABLE ?auto_50311 ) ( ON ?auto_50306 ?auto_50305 ) ( not ( = ?auto_50305 ?auto_50306 ) ) ( not ( = ?auto_50305 ?auto_50307 ) ) ( TRUCK-AT ?auto_50310 ?auto_50309 ) ( not ( = ?auto_50309 ?auto_50308 ) ) ( HOIST-AT ?auto_50312 ?auto_50309 ) ( LIFTING ?auto_50312 ?auto_50307 ) ( not ( = ?auto_50311 ?auto_50312 ) ) ( ON ?auto_50304 ?auto_50303 ) ( ON ?auto_50305 ?auto_50304 ) ( not ( = ?auto_50303 ?auto_50304 ) ) ( not ( = ?auto_50303 ?auto_50305 ) ) ( not ( = ?auto_50303 ?auto_50306 ) ) ( not ( = ?auto_50303 ?auto_50307 ) ) ( not ( = ?auto_50304 ?auto_50305 ) ) ( not ( = ?auto_50304 ?auto_50306 ) ) ( not ( = ?auto_50304 ?auto_50307 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_50305 ?auto_50306 ?auto_50307 )
      ( MAKE-4CRATE-VERIFY ?auto_50303 ?auto_50304 ?auto_50305 ?auto_50306 ?auto_50307 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_50341 - SURFACE
      ?auto_50342 - SURFACE
      ?auto_50343 - SURFACE
      ?auto_50344 - SURFACE
      ?auto_50345 - SURFACE
    )
    :vars
    (
      ?auto_50348 - HOIST
      ?auto_50351 - PLACE
      ?auto_50350 - TRUCK
      ?auto_50347 - PLACE
      ?auto_50349 - HOIST
      ?auto_50346 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_50348 ?auto_50351 ) ( SURFACE-AT ?auto_50344 ?auto_50351 ) ( CLEAR ?auto_50344 ) ( IS-CRATE ?auto_50345 ) ( not ( = ?auto_50344 ?auto_50345 ) ) ( AVAILABLE ?auto_50348 ) ( ON ?auto_50344 ?auto_50343 ) ( not ( = ?auto_50343 ?auto_50344 ) ) ( not ( = ?auto_50343 ?auto_50345 ) ) ( TRUCK-AT ?auto_50350 ?auto_50347 ) ( not ( = ?auto_50347 ?auto_50351 ) ) ( HOIST-AT ?auto_50349 ?auto_50347 ) ( not ( = ?auto_50348 ?auto_50349 ) ) ( AVAILABLE ?auto_50349 ) ( SURFACE-AT ?auto_50345 ?auto_50347 ) ( ON ?auto_50345 ?auto_50346 ) ( CLEAR ?auto_50345 ) ( not ( = ?auto_50344 ?auto_50346 ) ) ( not ( = ?auto_50345 ?auto_50346 ) ) ( not ( = ?auto_50343 ?auto_50346 ) ) ( ON ?auto_50342 ?auto_50341 ) ( ON ?auto_50343 ?auto_50342 ) ( not ( = ?auto_50341 ?auto_50342 ) ) ( not ( = ?auto_50341 ?auto_50343 ) ) ( not ( = ?auto_50341 ?auto_50344 ) ) ( not ( = ?auto_50341 ?auto_50345 ) ) ( not ( = ?auto_50341 ?auto_50346 ) ) ( not ( = ?auto_50342 ?auto_50343 ) ) ( not ( = ?auto_50342 ?auto_50344 ) ) ( not ( = ?auto_50342 ?auto_50345 ) ) ( not ( = ?auto_50342 ?auto_50346 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_50343 ?auto_50344 ?auto_50345 )
      ( MAKE-4CRATE-VERIFY ?auto_50341 ?auto_50342 ?auto_50343 ?auto_50344 ?auto_50345 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_50380 - SURFACE
      ?auto_50381 - SURFACE
      ?auto_50382 - SURFACE
      ?auto_50383 - SURFACE
      ?auto_50384 - SURFACE
    )
    :vars
    (
      ?auto_50390 - HOIST
      ?auto_50389 - PLACE
      ?auto_50385 - PLACE
      ?auto_50386 - HOIST
      ?auto_50388 - SURFACE
      ?auto_50387 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_50390 ?auto_50389 ) ( SURFACE-AT ?auto_50383 ?auto_50389 ) ( CLEAR ?auto_50383 ) ( IS-CRATE ?auto_50384 ) ( not ( = ?auto_50383 ?auto_50384 ) ) ( AVAILABLE ?auto_50390 ) ( ON ?auto_50383 ?auto_50382 ) ( not ( = ?auto_50382 ?auto_50383 ) ) ( not ( = ?auto_50382 ?auto_50384 ) ) ( not ( = ?auto_50385 ?auto_50389 ) ) ( HOIST-AT ?auto_50386 ?auto_50385 ) ( not ( = ?auto_50390 ?auto_50386 ) ) ( AVAILABLE ?auto_50386 ) ( SURFACE-AT ?auto_50384 ?auto_50385 ) ( ON ?auto_50384 ?auto_50388 ) ( CLEAR ?auto_50384 ) ( not ( = ?auto_50383 ?auto_50388 ) ) ( not ( = ?auto_50384 ?auto_50388 ) ) ( not ( = ?auto_50382 ?auto_50388 ) ) ( TRUCK-AT ?auto_50387 ?auto_50389 ) ( ON ?auto_50381 ?auto_50380 ) ( ON ?auto_50382 ?auto_50381 ) ( not ( = ?auto_50380 ?auto_50381 ) ) ( not ( = ?auto_50380 ?auto_50382 ) ) ( not ( = ?auto_50380 ?auto_50383 ) ) ( not ( = ?auto_50380 ?auto_50384 ) ) ( not ( = ?auto_50380 ?auto_50388 ) ) ( not ( = ?auto_50381 ?auto_50382 ) ) ( not ( = ?auto_50381 ?auto_50383 ) ) ( not ( = ?auto_50381 ?auto_50384 ) ) ( not ( = ?auto_50381 ?auto_50388 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_50382 ?auto_50383 ?auto_50384 )
      ( MAKE-4CRATE-VERIFY ?auto_50380 ?auto_50381 ?auto_50382 ?auto_50383 ?auto_50384 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_50419 - SURFACE
      ?auto_50420 - SURFACE
      ?auto_50421 - SURFACE
      ?auto_50422 - SURFACE
      ?auto_50423 - SURFACE
    )
    :vars
    (
      ?auto_50424 - HOIST
      ?auto_50426 - PLACE
      ?auto_50425 - PLACE
      ?auto_50428 - HOIST
      ?auto_50429 - SURFACE
      ?auto_50427 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_50424 ?auto_50426 ) ( IS-CRATE ?auto_50423 ) ( not ( = ?auto_50422 ?auto_50423 ) ) ( not ( = ?auto_50421 ?auto_50422 ) ) ( not ( = ?auto_50421 ?auto_50423 ) ) ( not ( = ?auto_50425 ?auto_50426 ) ) ( HOIST-AT ?auto_50428 ?auto_50425 ) ( not ( = ?auto_50424 ?auto_50428 ) ) ( AVAILABLE ?auto_50428 ) ( SURFACE-AT ?auto_50423 ?auto_50425 ) ( ON ?auto_50423 ?auto_50429 ) ( CLEAR ?auto_50423 ) ( not ( = ?auto_50422 ?auto_50429 ) ) ( not ( = ?auto_50423 ?auto_50429 ) ) ( not ( = ?auto_50421 ?auto_50429 ) ) ( TRUCK-AT ?auto_50427 ?auto_50426 ) ( SURFACE-AT ?auto_50421 ?auto_50426 ) ( CLEAR ?auto_50421 ) ( LIFTING ?auto_50424 ?auto_50422 ) ( IS-CRATE ?auto_50422 ) ( ON ?auto_50420 ?auto_50419 ) ( ON ?auto_50421 ?auto_50420 ) ( not ( = ?auto_50419 ?auto_50420 ) ) ( not ( = ?auto_50419 ?auto_50421 ) ) ( not ( = ?auto_50419 ?auto_50422 ) ) ( not ( = ?auto_50419 ?auto_50423 ) ) ( not ( = ?auto_50419 ?auto_50429 ) ) ( not ( = ?auto_50420 ?auto_50421 ) ) ( not ( = ?auto_50420 ?auto_50422 ) ) ( not ( = ?auto_50420 ?auto_50423 ) ) ( not ( = ?auto_50420 ?auto_50429 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_50421 ?auto_50422 ?auto_50423 )
      ( MAKE-4CRATE-VERIFY ?auto_50419 ?auto_50420 ?auto_50421 ?auto_50422 ?auto_50423 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_50458 - SURFACE
      ?auto_50459 - SURFACE
      ?auto_50460 - SURFACE
      ?auto_50461 - SURFACE
      ?auto_50462 - SURFACE
    )
    :vars
    (
      ?auto_50467 - HOIST
      ?auto_50463 - PLACE
      ?auto_50466 - PLACE
      ?auto_50468 - HOIST
      ?auto_50464 - SURFACE
      ?auto_50465 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_50467 ?auto_50463 ) ( IS-CRATE ?auto_50462 ) ( not ( = ?auto_50461 ?auto_50462 ) ) ( not ( = ?auto_50460 ?auto_50461 ) ) ( not ( = ?auto_50460 ?auto_50462 ) ) ( not ( = ?auto_50466 ?auto_50463 ) ) ( HOIST-AT ?auto_50468 ?auto_50466 ) ( not ( = ?auto_50467 ?auto_50468 ) ) ( AVAILABLE ?auto_50468 ) ( SURFACE-AT ?auto_50462 ?auto_50466 ) ( ON ?auto_50462 ?auto_50464 ) ( CLEAR ?auto_50462 ) ( not ( = ?auto_50461 ?auto_50464 ) ) ( not ( = ?auto_50462 ?auto_50464 ) ) ( not ( = ?auto_50460 ?auto_50464 ) ) ( TRUCK-AT ?auto_50465 ?auto_50463 ) ( SURFACE-AT ?auto_50460 ?auto_50463 ) ( CLEAR ?auto_50460 ) ( IS-CRATE ?auto_50461 ) ( AVAILABLE ?auto_50467 ) ( IN ?auto_50461 ?auto_50465 ) ( ON ?auto_50459 ?auto_50458 ) ( ON ?auto_50460 ?auto_50459 ) ( not ( = ?auto_50458 ?auto_50459 ) ) ( not ( = ?auto_50458 ?auto_50460 ) ) ( not ( = ?auto_50458 ?auto_50461 ) ) ( not ( = ?auto_50458 ?auto_50462 ) ) ( not ( = ?auto_50458 ?auto_50464 ) ) ( not ( = ?auto_50459 ?auto_50460 ) ) ( not ( = ?auto_50459 ?auto_50461 ) ) ( not ( = ?auto_50459 ?auto_50462 ) ) ( not ( = ?auto_50459 ?auto_50464 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_50460 ?auto_50461 ?auto_50462 )
      ( MAKE-4CRATE-VERIFY ?auto_50458 ?auto_50459 ?auto_50460 ?auto_50461 ?auto_50462 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_50731 - SURFACE
      ?auto_50732 - SURFACE
    )
    :vars
    (
      ?auto_50736 - HOIST
      ?auto_50739 - PLACE
      ?auto_50734 - SURFACE
      ?auto_50735 - PLACE
      ?auto_50733 - HOIST
      ?auto_50737 - SURFACE
      ?auto_50738 - TRUCK
      ?auto_50740 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_50736 ?auto_50739 ) ( SURFACE-AT ?auto_50731 ?auto_50739 ) ( CLEAR ?auto_50731 ) ( IS-CRATE ?auto_50732 ) ( not ( = ?auto_50731 ?auto_50732 ) ) ( ON ?auto_50731 ?auto_50734 ) ( not ( = ?auto_50734 ?auto_50731 ) ) ( not ( = ?auto_50734 ?auto_50732 ) ) ( not ( = ?auto_50735 ?auto_50739 ) ) ( HOIST-AT ?auto_50733 ?auto_50735 ) ( not ( = ?auto_50736 ?auto_50733 ) ) ( AVAILABLE ?auto_50733 ) ( SURFACE-AT ?auto_50732 ?auto_50735 ) ( ON ?auto_50732 ?auto_50737 ) ( CLEAR ?auto_50732 ) ( not ( = ?auto_50731 ?auto_50737 ) ) ( not ( = ?auto_50732 ?auto_50737 ) ) ( not ( = ?auto_50734 ?auto_50737 ) ) ( TRUCK-AT ?auto_50738 ?auto_50739 ) ( LIFTING ?auto_50736 ?auto_50740 ) ( IS-CRATE ?auto_50740 ) ( not ( = ?auto_50731 ?auto_50740 ) ) ( not ( = ?auto_50732 ?auto_50740 ) ) ( not ( = ?auto_50734 ?auto_50740 ) ) ( not ( = ?auto_50737 ?auto_50740 ) ) )
    :subtasks
    ( ( !LOAD ?auto_50736 ?auto_50740 ?auto_50738 ?auto_50739 )
      ( MAKE-1CRATE ?auto_50731 ?auto_50732 )
      ( MAKE-1CRATE-VERIFY ?auto_50731 ?auto_50732 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_51117 - SURFACE
      ?auto_51118 - SURFACE
      ?auto_51119 - SURFACE
      ?auto_51120 - SURFACE
      ?auto_51121 - SURFACE
      ?auto_51122 - SURFACE
    )
    :vars
    (
      ?auto_51123 - HOIST
      ?auto_51124 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_51123 ?auto_51124 ) ( SURFACE-AT ?auto_51121 ?auto_51124 ) ( CLEAR ?auto_51121 ) ( LIFTING ?auto_51123 ?auto_51122 ) ( IS-CRATE ?auto_51122 ) ( not ( = ?auto_51121 ?auto_51122 ) ) ( ON ?auto_51118 ?auto_51117 ) ( ON ?auto_51119 ?auto_51118 ) ( ON ?auto_51120 ?auto_51119 ) ( ON ?auto_51121 ?auto_51120 ) ( not ( = ?auto_51117 ?auto_51118 ) ) ( not ( = ?auto_51117 ?auto_51119 ) ) ( not ( = ?auto_51117 ?auto_51120 ) ) ( not ( = ?auto_51117 ?auto_51121 ) ) ( not ( = ?auto_51117 ?auto_51122 ) ) ( not ( = ?auto_51118 ?auto_51119 ) ) ( not ( = ?auto_51118 ?auto_51120 ) ) ( not ( = ?auto_51118 ?auto_51121 ) ) ( not ( = ?auto_51118 ?auto_51122 ) ) ( not ( = ?auto_51119 ?auto_51120 ) ) ( not ( = ?auto_51119 ?auto_51121 ) ) ( not ( = ?auto_51119 ?auto_51122 ) ) ( not ( = ?auto_51120 ?auto_51121 ) ) ( not ( = ?auto_51120 ?auto_51122 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_51121 ?auto_51122 )
      ( MAKE-5CRATE-VERIFY ?auto_51117 ?auto_51118 ?auto_51119 ?auto_51120 ?auto_51121 ?auto_51122 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_51151 - SURFACE
      ?auto_51152 - SURFACE
      ?auto_51153 - SURFACE
      ?auto_51154 - SURFACE
      ?auto_51155 - SURFACE
      ?auto_51156 - SURFACE
    )
    :vars
    (
      ?auto_51159 - HOIST
      ?auto_51158 - PLACE
      ?auto_51157 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_51159 ?auto_51158 ) ( SURFACE-AT ?auto_51155 ?auto_51158 ) ( CLEAR ?auto_51155 ) ( IS-CRATE ?auto_51156 ) ( not ( = ?auto_51155 ?auto_51156 ) ) ( TRUCK-AT ?auto_51157 ?auto_51158 ) ( AVAILABLE ?auto_51159 ) ( IN ?auto_51156 ?auto_51157 ) ( ON ?auto_51155 ?auto_51154 ) ( not ( = ?auto_51154 ?auto_51155 ) ) ( not ( = ?auto_51154 ?auto_51156 ) ) ( ON ?auto_51152 ?auto_51151 ) ( ON ?auto_51153 ?auto_51152 ) ( ON ?auto_51154 ?auto_51153 ) ( not ( = ?auto_51151 ?auto_51152 ) ) ( not ( = ?auto_51151 ?auto_51153 ) ) ( not ( = ?auto_51151 ?auto_51154 ) ) ( not ( = ?auto_51151 ?auto_51155 ) ) ( not ( = ?auto_51151 ?auto_51156 ) ) ( not ( = ?auto_51152 ?auto_51153 ) ) ( not ( = ?auto_51152 ?auto_51154 ) ) ( not ( = ?auto_51152 ?auto_51155 ) ) ( not ( = ?auto_51152 ?auto_51156 ) ) ( not ( = ?auto_51153 ?auto_51154 ) ) ( not ( = ?auto_51153 ?auto_51155 ) ) ( not ( = ?auto_51153 ?auto_51156 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_51154 ?auto_51155 ?auto_51156 )
      ( MAKE-5CRATE-VERIFY ?auto_51151 ?auto_51152 ?auto_51153 ?auto_51154 ?auto_51155 ?auto_51156 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_51191 - SURFACE
      ?auto_51192 - SURFACE
      ?auto_51193 - SURFACE
      ?auto_51194 - SURFACE
      ?auto_51195 - SURFACE
      ?auto_51196 - SURFACE
    )
    :vars
    (
      ?auto_51199 - HOIST
      ?auto_51200 - PLACE
      ?auto_51198 - TRUCK
      ?auto_51197 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_51199 ?auto_51200 ) ( SURFACE-AT ?auto_51195 ?auto_51200 ) ( CLEAR ?auto_51195 ) ( IS-CRATE ?auto_51196 ) ( not ( = ?auto_51195 ?auto_51196 ) ) ( AVAILABLE ?auto_51199 ) ( IN ?auto_51196 ?auto_51198 ) ( ON ?auto_51195 ?auto_51194 ) ( not ( = ?auto_51194 ?auto_51195 ) ) ( not ( = ?auto_51194 ?auto_51196 ) ) ( TRUCK-AT ?auto_51198 ?auto_51197 ) ( not ( = ?auto_51197 ?auto_51200 ) ) ( ON ?auto_51192 ?auto_51191 ) ( ON ?auto_51193 ?auto_51192 ) ( ON ?auto_51194 ?auto_51193 ) ( not ( = ?auto_51191 ?auto_51192 ) ) ( not ( = ?auto_51191 ?auto_51193 ) ) ( not ( = ?auto_51191 ?auto_51194 ) ) ( not ( = ?auto_51191 ?auto_51195 ) ) ( not ( = ?auto_51191 ?auto_51196 ) ) ( not ( = ?auto_51192 ?auto_51193 ) ) ( not ( = ?auto_51192 ?auto_51194 ) ) ( not ( = ?auto_51192 ?auto_51195 ) ) ( not ( = ?auto_51192 ?auto_51196 ) ) ( not ( = ?auto_51193 ?auto_51194 ) ) ( not ( = ?auto_51193 ?auto_51195 ) ) ( not ( = ?auto_51193 ?auto_51196 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_51194 ?auto_51195 ?auto_51196 )
      ( MAKE-5CRATE-VERIFY ?auto_51191 ?auto_51192 ?auto_51193 ?auto_51194 ?auto_51195 ?auto_51196 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_51236 - SURFACE
      ?auto_51237 - SURFACE
      ?auto_51238 - SURFACE
      ?auto_51239 - SURFACE
      ?auto_51240 - SURFACE
      ?auto_51241 - SURFACE
    )
    :vars
    (
      ?auto_51243 - HOIST
      ?auto_51244 - PLACE
      ?auto_51246 - TRUCK
      ?auto_51245 - PLACE
      ?auto_51242 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_51243 ?auto_51244 ) ( SURFACE-AT ?auto_51240 ?auto_51244 ) ( CLEAR ?auto_51240 ) ( IS-CRATE ?auto_51241 ) ( not ( = ?auto_51240 ?auto_51241 ) ) ( AVAILABLE ?auto_51243 ) ( ON ?auto_51240 ?auto_51239 ) ( not ( = ?auto_51239 ?auto_51240 ) ) ( not ( = ?auto_51239 ?auto_51241 ) ) ( TRUCK-AT ?auto_51246 ?auto_51245 ) ( not ( = ?auto_51245 ?auto_51244 ) ) ( HOIST-AT ?auto_51242 ?auto_51245 ) ( LIFTING ?auto_51242 ?auto_51241 ) ( not ( = ?auto_51243 ?auto_51242 ) ) ( ON ?auto_51237 ?auto_51236 ) ( ON ?auto_51238 ?auto_51237 ) ( ON ?auto_51239 ?auto_51238 ) ( not ( = ?auto_51236 ?auto_51237 ) ) ( not ( = ?auto_51236 ?auto_51238 ) ) ( not ( = ?auto_51236 ?auto_51239 ) ) ( not ( = ?auto_51236 ?auto_51240 ) ) ( not ( = ?auto_51236 ?auto_51241 ) ) ( not ( = ?auto_51237 ?auto_51238 ) ) ( not ( = ?auto_51237 ?auto_51239 ) ) ( not ( = ?auto_51237 ?auto_51240 ) ) ( not ( = ?auto_51237 ?auto_51241 ) ) ( not ( = ?auto_51238 ?auto_51239 ) ) ( not ( = ?auto_51238 ?auto_51240 ) ) ( not ( = ?auto_51238 ?auto_51241 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_51239 ?auto_51240 ?auto_51241 )
      ( MAKE-5CRATE-VERIFY ?auto_51236 ?auto_51237 ?auto_51238 ?auto_51239 ?auto_51240 ?auto_51241 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_51286 - SURFACE
      ?auto_51287 - SURFACE
      ?auto_51288 - SURFACE
      ?auto_51289 - SURFACE
      ?auto_51290 - SURFACE
      ?auto_51291 - SURFACE
    )
    :vars
    (
      ?auto_51295 - HOIST
      ?auto_51293 - PLACE
      ?auto_51294 - TRUCK
      ?auto_51292 - PLACE
      ?auto_51297 - HOIST
      ?auto_51296 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_51295 ?auto_51293 ) ( SURFACE-AT ?auto_51290 ?auto_51293 ) ( CLEAR ?auto_51290 ) ( IS-CRATE ?auto_51291 ) ( not ( = ?auto_51290 ?auto_51291 ) ) ( AVAILABLE ?auto_51295 ) ( ON ?auto_51290 ?auto_51289 ) ( not ( = ?auto_51289 ?auto_51290 ) ) ( not ( = ?auto_51289 ?auto_51291 ) ) ( TRUCK-AT ?auto_51294 ?auto_51292 ) ( not ( = ?auto_51292 ?auto_51293 ) ) ( HOIST-AT ?auto_51297 ?auto_51292 ) ( not ( = ?auto_51295 ?auto_51297 ) ) ( AVAILABLE ?auto_51297 ) ( SURFACE-AT ?auto_51291 ?auto_51292 ) ( ON ?auto_51291 ?auto_51296 ) ( CLEAR ?auto_51291 ) ( not ( = ?auto_51290 ?auto_51296 ) ) ( not ( = ?auto_51291 ?auto_51296 ) ) ( not ( = ?auto_51289 ?auto_51296 ) ) ( ON ?auto_51287 ?auto_51286 ) ( ON ?auto_51288 ?auto_51287 ) ( ON ?auto_51289 ?auto_51288 ) ( not ( = ?auto_51286 ?auto_51287 ) ) ( not ( = ?auto_51286 ?auto_51288 ) ) ( not ( = ?auto_51286 ?auto_51289 ) ) ( not ( = ?auto_51286 ?auto_51290 ) ) ( not ( = ?auto_51286 ?auto_51291 ) ) ( not ( = ?auto_51286 ?auto_51296 ) ) ( not ( = ?auto_51287 ?auto_51288 ) ) ( not ( = ?auto_51287 ?auto_51289 ) ) ( not ( = ?auto_51287 ?auto_51290 ) ) ( not ( = ?auto_51287 ?auto_51291 ) ) ( not ( = ?auto_51287 ?auto_51296 ) ) ( not ( = ?auto_51288 ?auto_51289 ) ) ( not ( = ?auto_51288 ?auto_51290 ) ) ( not ( = ?auto_51288 ?auto_51291 ) ) ( not ( = ?auto_51288 ?auto_51296 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_51289 ?auto_51290 ?auto_51291 )
      ( MAKE-5CRATE-VERIFY ?auto_51286 ?auto_51287 ?auto_51288 ?auto_51289 ?auto_51290 ?auto_51291 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_51337 - SURFACE
      ?auto_51338 - SURFACE
      ?auto_51339 - SURFACE
      ?auto_51340 - SURFACE
      ?auto_51341 - SURFACE
      ?auto_51342 - SURFACE
    )
    :vars
    (
      ?auto_51346 - HOIST
      ?auto_51345 - PLACE
      ?auto_51343 - PLACE
      ?auto_51344 - HOIST
      ?auto_51348 - SURFACE
      ?auto_51347 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_51346 ?auto_51345 ) ( SURFACE-AT ?auto_51341 ?auto_51345 ) ( CLEAR ?auto_51341 ) ( IS-CRATE ?auto_51342 ) ( not ( = ?auto_51341 ?auto_51342 ) ) ( AVAILABLE ?auto_51346 ) ( ON ?auto_51341 ?auto_51340 ) ( not ( = ?auto_51340 ?auto_51341 ) ) ( not ( = ?auto_51340 ?auto_51342 ) ) ( not ( = ?auto_51343 ?auto_51345 ) ) ( HOIST-AT ?auto_51344 ?auto_51343 ) ( not ( = ?auto_51346 ?auto_51344 ) ) ( AVAILABLE ?auto_51344 ) ( SURFACE-AT ?auto_51342 ?auto_51343 ) ( ON ?auto_51342 ?auto_51348 ) ( CLEAR ?auto_51342 ) ( not ( = ?auto_51341 ?auto_51348 ) ) ( not ( = ?auto_51342 ?auto_51348 ) ) ( not ( = ?auto_51340 ?auto_51348 ) ) ( TRUCK-AT ?auto_51347 ?auto_51345 ) ( ON ?auto_51338 ?auto_51337 ) ( ON ?auto_51339 ?auto_51338 ) ( ON ?auto_51340 ?auto_51339 ) ( not ( = ?auto_51337 ?auto_51338 ) ) ( not ( = ?auto_51337 ?auto_51339 ) ) ( not ( = ?auto_51337 ?auto_51340 ) ) ( not ( = ?auto_51337 ?auto_51341 ) ) ( not ( = ?auto_51337 ?auto_51342 ) ) ( not ( = ?auto_51337 ?auto_51348 ) ) ( not ( = ?auto_51338 ?auto_51339 ) ) ( not ( = ?auto_51338 ?auto_51340 ) ) ( not ( = ?auto_51338 ?auto_51341 ) ) ( not ( = ?auto_51338 ?auto_51342 ) ) ( not ( = ?auto_51338 ?auto_51348 ) ) ( not ( = ?auto_51339 ?auto_51340 ) ) ( not ( = ?auto_51339 ?auto_51341 ) ) ( not ( = ?auto_51339 ?auto_51342 ) ) ( not ( = ?auto_51339 ?auto_51348 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_51340 ?auto_51341 ?auto_51342 )
      ( MAKE-5CRATE-VERIFY ?auto_51337 ?auto_51338 ?auto_51339 ?auto_51340 ?auto_51341 ?auto_51342 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_51388 - SURFACE
      ?auto_51389 - SURFACE
      ?auto_51390 - SURFACE
      ?auto_51391 - SURFACE
      ?auto_51392 - SURFACE
      ?auto_51393 - SURFACE
    )
    :vars
    (
      ?auto_51398 - HOIST
      ?auto_51397 - PLACE
      ?auto_51399 - PLACE
      ?auto_51395 - HOIST
      ?auto_51396 - SURFACE
      ?auto_51394 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_51398 ?auto_51397 ) ( IS-CRATE ?auto_51393 ) ( not ( = ?auto_51392 ?auto_51393 ) ) ( not ( = ?auto_51391 ?auto_51392 ) ) ( not ( = ?auto_51391 ?auto_51393 ) ) ( not ( = ?auto_51399 ?auto_51397 ) ) ( HOIST-AT ?auto_51395 ?auto_51399 ) ( not ( = ?auto_51398 ?auto_51395 ) ) ( AVAILABLE ?auto_51395 ) ( SURFACE-AT ?auto_51393 ?auto_51399 ) ( ON ?auto_51393 ?auto_51396 ) ( CLEAR ?auto_51393 ) ( not ( = ?auto_51392 ?auto_51396 ) ) ( not ( = ?auto_51393 ?auto_51396 ) ) ( not ( = ?auto_51391 ?auto_51396 ) ) ( TRUCK-AT ?auto_51394 ?auto_51397 ) ( SURFACE-AT ?auto_51391 ?auto_51397 ) ( CLEAR ?auto_51391 ) ( LIFTING ?auto_51398 ?auto_51392 ) ( IS-CRATE ?auto_51392 ) ( ON ?auto_51389 ?auto_51388 ) ( ON ?auto_51390 ?auto_51389 ) ( ON ?auto_51391 ?auto_51390 ) ( not ( = ?auto_51388 ?auto_51389 ) ) ( not ( = ?auto_51388 ?auto_51390 ) ) ( not ( = ?auto_51388 ?auto_51391 ) ) ( not ( = ?auto_51388 ?auto_51392 ) ) ( not ( = ?auto_51388 ?auto_51393 ) ) ( not ( = ?auto_51388 ?auto_51396 ) ) ( not ( = ?auto_51389 ?auto_51390 ) ) ( not ( = ?auto_51389 ?auto_51391 ) ) ( not ( = ?auto_51389 ?auto_51392 ) ) ( not ( = ?auto_51389 ?auto_51393 ) ) ( not ( = ?auto_51389 ?auto_51396 ) ) ( not ( = ?auto_51390 ?auto_51391 ) ) ( not ( = ?auto_51390 ?auto_51392 ) ) ( not ( = ?auto_51390 ?auto_51393 ) ) ( not ( = ?auto_51390 ?auto_51396 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_51391 ?auto_51392 ?auto_51393 )
      ( MAKE-5CRATE-VERIFY ?auto_51388 ?auto_51389 ?auto_51390 ?auto_51391 ?auto_51392 ?auto_51393 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_51439 - SURFACE
      ?auto_51440 - SURFACE
      ?auto_51441 - SURFACE
      ?auto_51442 - SURFACE
      ?auto_51443 - SURFACE
      ?auto_51444 - SURFACE
    )
    :vars
    (
      ?auto_51450 - HOIST
      ?auto_51446 - PLACE
      ?auto_51447 - PLACE
      ?auto_51449 - HOIST
      ?auto_51448 - SURFACE
      ?auto_51445 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_51450 ?auto_51446 ) ( IS-CRATE ?auto_51444 ) ( not ( = ?auto_51443 ?auto_51444 ) ) ( not ( = ?auto_51442 ?auto_51443 ) ) ( not ( = ?auto_51442 ?auto_51444 ) ) ( not ( = ?auto_51447 ?auto_51446 ) ) ( HOIST-AT ?auto_51449 ?auto_51447 ) ( not ( = ?auto_51450 ?auto_51449 ) ) ( AVAILABLE ?auto_51449 ) ( SURFACE-AT ?auto_51444 ?auto_51447 ) ( ON ?auto_51444 ?auto_51448 ) ( CLEAR ?auto_51444 ) ( not ( = ?auto_51443 ?auto_51448 ) ) ( not ( = ?auto_51444 ?auto_51448 ) ) ( not ( = ?auto_51442 ?auto_51448 ) ) ( TRUCK-AT ?auto_51445 ?auto_51446 ) ( SURFACE-AT ?auto_51442 ?auto_51446 ) ( CLEAR ?auto_51442 ) ( IS-CRATE ?auto_51443 ) ( AVAILABLE ?auto_51450 ) ( IN ?auto_51443 ?auto_51445 ) ( ON ?auto_51440 ?auto_51439 ) ( ON ?auto_51441 ?auto_51440 ) ( ON ?auto_51442 ?auto_51441 ) ( not ( = ?auto_51439 ?auto_51440 ) ) ( not ( = ?auto_51439 ?auto_51441 ) ) ( not ( = ?auto_51439 ?auto_51442 ) ) ( not ( = ?auto_51439 ?auto_51443 ) ) ( not ( = ?auto_51439 ?auto_51444 ) ) ( not ( = ?auto_51439 ?auto_51448 ) ) ( not ( = ?auto_51440 ?auto_51441 ) ) ( not ( = ?auto_51440 ?auto_51442 ) ) ( not ( = ?auto_51440 ?auto_51443 ) ) ( not ( = ?auto_51440 ?auto_51444 ) ) ( not ( = ?auto_51440 ?auto_51448 ) ) ( not ( = ?auto_51441 ?auto_51442 ) ) ( not ( = ?auto_51441 ?auto_51443 ) ) ( not ( = ?auto_51441 ?auto_51444 ) ) ( not ( = ?auto_51441 ?auto_51448 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_51442 ?auto_51443 ?auto_51444 )
      ( MAKE-5CRATE-VERIFY ?auto_51439 ?auto_51440 ?auto_51441 ?auto_51442 ?auto_51443 ?auto_51444 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_51807 - SURFACE
      ?auto_51808 - SURFACE
    )
    :vars
    (
      ?auto_51814 - HOIST
      ?auto_51815 - PLACE
      ?auto_51813 - SURFACE
      ?auto_51810 - TRUCK
      ?auto_51812 - PLACE
      ?auto_51809 - HOIST
      ?auto_51811 - SURFACE
      ?auto_51816 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_51814 ?auto_51815 ) ( SURFACE-AT ?auto_51807 ?auto_51815 ) ( CLEAR ?auto_51807 ) ( IS-CRATE ?auto_51808 ) ( not ( = ?auto_51807 ?auto_51808 ) ) ( AVAILABLE ?auto_51814 ) ( ON ?auto_51807 ?auto_51813 ) ( not ( = ?auto_51813 ?auto_51807 ) ) ( not ( = ?auto_51813 ?auto_51808 ) ) ( TRUCK-AT ?auto_51810 ?auto_51812 ) ( not ( = ?auto_51812 ?auto_51815 ) ) ( HOIST-AT ?auto_51809 ?auto_51812 ) ( not ( = ?auto_51814 ?auto_51809 ) ) ( SURFACE-AT ?auto_51808 ?auto_51812 ) ( ON ?auto_51808 ?auto_51811 ) ( CLEAR ?auto_51808 ) ( not ( = ?auto_51807 ?auto_51811 ) ) ( not ( = ?auto_51808 ?auto_51811 ) ) ( not ( = ?auto_51813 ?auto_51811 ) ) ( LIFTING ?auto_51809 ?auto_51816 ) ( IS-CRATE ?auto_51816 ) ( not ( = ?auto_51807 ?auto_51816 ) ) ( not ( = ?auto_51808 ?auto_51816 ) ) ( not ( = ?auto_51813 ?auto_51816 ) ) ( not ( = ?auto_51811 ?auto_51816 ) ) )
    :subtasks
    ( ( !LOAD ?auto_51809 ?auto_51816 ?auto_51810 ?auto_51812 )
      ( MAKE-1CRATE ?auto_51807 ?auto_51808 )
      ( MAKE-1CRATE-VERIFY ?auto_51807 ?auto_51808 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_52633 - SURFACE
      ?auto_52634 - SURFACE
      ?auto_52635 - SURFACE
      ?auto_52636 - SURFACE
      ?auto_52637 - SURFACE
      ?auto_52638 - SURFACE
      ?auto_52639 - SURFACE
    )
    :vars
    (
      ?auto_52641 - HOIST
      ?auto_52640 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_52641 ?auto_52640 ) ( SURFACE-AT ?auto_52638 ?auto_52640 ) ( CLEAR ?auto_52638 ) ( LIFTING ?auto_52641 ?auto_52639 ) ( IS-CRATE ?auto_52639 ) ( not ( = ?auto_52638 ?auto_52639 ) ) ( ON ?auto_52634 ?auto_52633 ) ( ON ?auto_52635 ?auto_52634 ) ( ON ?auto_52636 ?auto_52635 ) ( ON ?auto_52637 ?auto_52636 ) ( ON ?auto_52638 ?auto_52637 ) ( not ( = ?auto_52633 ?auto_52634 ) ) ( not ( = ?auto_52633 ?auto_52635 ) ) ( not ( = ?auto_52633 ?auto_52636 ) ) ( not ( = ?auto_52633 ?auto_52637 ) ) ( not ( = ?auto_52633 ?auto_52638 ) ) ( not ( = ?auto_52633 ?auto_52639 ) ) ( not ( = ?auto_52634 ?auto_52635 ) ) ( not ( = ?auto_52634 ?auto_52636 ) ) ( not ( = ?auto_52634 ?auto_52637 ) ) ( not ( = ?auto_52634 ?auto_52638 ) ) ( not ( = ?auto_52634 ?auto_52639 ) ) ( not ( = ?auto_52635 ?auto_52636 ) ) ( not ( = ?auto_52635 ?auto_52637 ) ) ( not ( = ?auto_52635 ?auto_52638 ) ) ( not ( = ?auto_52635 ?auto_52639 ) ) ( not ( = ?auto_52636 ?auto_52637 ) ) ( not ( = ?auto_52636 ?auto_52638 ) ) ( not ( = ?auto_52636 ?auto_52639 ) ) ( not ( = ?auto_52637 ?auto_52638 ) ) ( not ( = ?auto_52637 ?auto_52639 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_52638 ?auto_52639 )
      ( MAKE-6CRATE-VERIFY ?auto_52633 ?auto_52634 ?auto_52635 ?auto_52636 ?auto_52637 ?auto_52638 ?auto_52639 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_52677 - SURFACE
      ?auto_52678 - SURFACE
      ?auto_52679 - SURFACE
      ?auto_52680 - SURFACE
      ?auto_52681 - SURFACE
      ?auto_52682 - SURFACE
      ?auto_52683 - SURFACE
    )
    :vars
    (
      ?auto_52685 - HOIST
      ?auto_52686 - PLACE
      ?auto_52684 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_52685 ?auto_52686 ) ( SURFACE-AT ?auto_52682 ?auto_52686 ) ( CLEAR ?auto_52682 ) ( IS-CRATE ?auto_52683 ) ( not ( = ?auto_52682 ?auto_52683 ) ) ( TRUCK-AT ?auto_52684 ?auto_52686 ) ( AVAILABLE ?auto_52685 ) ( IN ?auto_52683 ?auto_52684 ) ( ON ?auto_52682 ?auto_52681 ) ( not ( = ?auto_52681 ?auto_52682 ) ) ( not ( = ?auto_52681 ?auto_52683 ) ) ( ON ?auto_52678 ?auto_52677 ) ( ON ?auto_52679 ?auto_52678 ) ( ON ?auto_52680 ?auto_52679 ) ( ON ?auto_52681 ?auto_52680 ) ( not ( = ?auto_52677 ?auto_52678 ) ) ( not ( = ?auto_52677 ?auto_52679 ) ) ( not ( = ?auto_52677 ?auto_52680 ) ) ( not ( = ?auto_52677 ?auto_52681 ) ) ( not ( = ?auto_52677 ?auto_52682 ) ) ( not ( = ?auto_52677 ?auto_52683 ) ) ( not ( = ?auto_52678 ?auto_52679 ) ) ( not ( = ?auto_52678 ?auto_52680 ) ) ( not ( = ?auto_52678 ?auto_52681 ) ) ( not ( = ?auto_52678 ?auto_52682 ) ) ( not ( = ?auto_52678 ?auto_52683 ) ) ( not ( = ?auto_52679 ?auto_52680 ) ) ( not ( = ?auto_52679 ?auto_52681 ) ) ( not ( = ?auto_52679 ?auto_52682 ) ) ( not ( = ?auto_52679 ?auto_52683 ) ) ( not ( = ?auto_52680 ?auto_52681 ) ) ( not ( = ?auto_52680 ?auto_52682 ) ) ( not ( = ?auto_52680 ?auto_52683 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_52681 ?auto_52682 ?auto_52683 )
      ( MAKE-6CRATE-VERIFY ?auto_52677 ?auto_52678 ?auto_52679 ?auto_52680 ?auto_52681 ?auto_52682 ?auto_52683 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_52728 - SURFACE
      ?auto_52729 - SURFACE
      ?auto_52730 - SURFACE
      ?auto_52731 - SURFACE
      ?auto_52732 - SURFACE
      ?auto_52733 - SURFACE
      ?auto_52734 - SURFACE
    )
    :vars
    (
      ?auto_52735 - HOIST
      ?auto_52737 - PLACE
      ?auto_52738 - TRUCK
      ?auto_52736 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_52735 ?auto_52737 ) ( SURFACE-AT ?auto_52733 ?auto_52737 ) ( CLEAR ?auto_52733 ) ( IS-CRATE ?auto_52734 ) ( not ( = ?auto_52733 ?auto_52734 ) ) ( AVAILABLE ?auto_52735 ) ( IN ?auto_52734 ?auto_52738 ) ( ON ?auto_52733 ?auto_52732 ) ( not ( = ?auto_52732 ?auto_52733 ) ) ( not ( = ?auto_52732 ?auto_52734 ) ) ( TRUCK-AT ?auto_52738 ?auto_52736 ) ( not ( = ?auto_52736 ?auto_52737 ) ) ( ON ?auto_52729 ?auto_52728 ) ( ON ?auto_52730 ?auto_52729 ) ( ON ?auto_52731 ?auto_52730 ) ( ON ?auto_52732 ?auto_52731 ) ( not ( = ?auto_52728 ?auto_52729 ) ) ( not ( = ?auto_52728 ?auto_52730 ) ) ( not ( = ?auto_52728 ?auto_52731 ) ) ( not ( = ?auto_52728 ?auto_52732 ) ) ( not ( = ?auto_52728 ?auto_52733 ) ) ( not ( = ?auto_52728 ?auto_52734 ) ) ( not ( = ?auto_52729 ?auto_52730 ) ) ( not ( = ?auto_52729 ?auto_52731 ) ) ( not ( = ?auto_52729 ?auto_52732 ) ) ( not ( = ?auto_52729 ?auto_52733 ) ) ( not ( = ?auto_52729 ?auto_52734 ) ) ( not ( = ?auto_52730 ?auto_52731 ) ) ( not ( = ?auto_52730 ?auto_52732 ) ) ( not ( = ?auto_52730 ?auto_52733 ) ) ( not ( = ?auto_52730 ?auto_52734 ) ) ( not ( = ?auto_52731 ?auto_52732 ) ) ( not ( = ?auto_52731 ?auto_52733 ) ) ( not ( = ?auto_52731 ?auto_52734 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_52732 ?auto_52733 ?auto_52734 )
      ( MAKE-6CRATE-VERIFY ?auto_52728 ?auto_52729 ?auto_52730 ?auto_52731 ?auto_52732 ?auto_52733 ?auto_52734 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_52785 - SURFACE
      ?auto_52786 - SURFACE
      ?auto_52787 - SURFACE
      ?auto_52788 - SURFACE
      ?auto_52789 - SURFACE
      ?auto_52790 - SURFACE
      ?auto_52791 - SURFACE
    )
    :vars
    (
      ?auto_52795 - HOIST
      ?auto_52792 - PLACE
      ?auto_52793 - TRUCK
      ?auto_52794 - PLACE
      ?auto_52796 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_52795 ?auto_52792 ) ( SURFACE-AT ?auto_52790 ?auto_52792 ) ( CLEAR ?auto_52790 ) ( IS-CRATE ?auto_52791 ) ( not ( = ?auto_52790 ?auto_52791 ) ) ( AVAILABLE ?auto_52795 ) ( ON ?auto_52790 ?auto_52789 ) ( not ( = ?auto_52789 ?auto_52790 ) ) ( not ( = ?auto_52789 ?auto_52791 ) ) ( TRUCK-AT ?auto_52793 ?auto_52794 ) ( not ( = ?auto_52794 ?auto_52792 ) ) ( HOIST-AT ?auto_52796 ?auto_52794 ) ( LIFTING ?auto_52796 ?auto_52791 ) ( not ( = ?auto_52795 ?auto_52796 ) ) ( ON ?auto_52786 ?auto_52785 ) ( ON ?auto_52787 ?auto_52786 ) ( ON ?auto_52788 ?auto_52787 ) ( ON ?auto_52789 ?auto_52788 ) ( not ( = ?auto_52785 ?auto_52786 ) ) ( not ( = ?auto_52785 ?auto_52787 ) ) ( not ( = ?auto_52785 ?auto_52788 ) ) ( not ( = ?auto_52785 ?auto_52789 ) ) ( not ( = ?auto_52785 ?auto_52790 ) ) ( not ( = ?auto_52785 ?auto_52791 ) ) ( not ( = ?auto_52786 ?auto_52787 ) ) ( not ( = ?auto_52786 ?auto_52788 ) ) ( not ( = ?auto_52786 ?auto_52789 ) ) ( not ( = ?auto_52786 ?auto_52790 ) ) ( not ( = ?auto_52786 ?auto_52791 ) ) ( not ( = ?auto_52787 ?auto_52788 ) ) ( not ( = ?auto_52787 ?auto_52789 ) ) ( not ( = ?auto_52787 ?auto_52790 ) ) ( not ( = ?auto_52787 ?auto_52791 ) ) ( not ( = ?auto_52788 ?auto_52789 ) ) ( not ( = ?auto_52788 ?auto_52790 ) ) ( not ( = ?auto_52788 ?auto_52791 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_52789 ?auto_52790 ?auto_52791 )
      ( MAKE-6CRATE-VERIFY ?auto_52785 ?auto_52786 ?auto_52787 ?auto_52788 ?auto_52789 ?auto_52790 ?auto_52791 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_52848 - SURFACE
      ?auto_52849 - SURFACE
      ?auto_52850 - SURFACE
      ?auto_52851 - SURFACE
      ?auto_52852 - SURFACE
      ?auto_52853 - SURFACE
      ?auto_52854 - SURFACE
    )
    :vars
    (
      ?auto_52857 - HOIST
      ?auto_52859 - PLACE
      ?auto_52856 - TRUCK
      ?auto_52860 - PLACE
      ?auto_52858 - HOIST
      ?auto_52855 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_52857 ?auto_52859 ) ( SURFACE-AT ?auto_52853 ?auto_52859 ) ( CLEAR ?auto_52853 ) ( IS-CRATE ?auto_52854 ) ( not ( = ?auto_52853 ?auto_52854 ) ) ( AVAILABLE ?auto_52857 ) ( ON ?auto_52853 ?auto_52852 ) ( not ( = ?auto_52852 ?auto_52853 ) ) ( not ( = ?auto_52852 ?auto_52854 ) ) ( TRUCK-AT ?auto_52856 ?auto_52860 ) ( not ( = ?auto_52860 ?auto_52859 ) ) ( HOIST-AT ?auto_52858 ?auto_52860 ) ( not ( = ?auto_52857 ?auto_52858 ) ) ( AVAILABLE ?auto_52858 ) ( SURFACE-AT ?auto_52854 ?auto_52860 ) ( ON ?auto_52854 ?auto_52855 ) ( CLEAR ?auto_52854 ) ( not ( = ?auto_52853 ?auto_52855 ) ) ( not ( = ?auto_52854 ?auto_52855 ) ) ( not ( = ?auto_52852 ?auto_52855 ) ) ( ON ?auto_52849 ?auto_52848 ) ( ON ?auto_52850 ?auto_52849 ) ( ON ?auto_52851 ?auto_52850 ) ( ON ?auto_52852 ?auto_52851 ) ( not ( = ?auto_52848 ?auto_52849 ) ) ( not ( = ?auto_52848 ?auto_52850 ) ) ( not ( = ?auto_52848 ?auto_52851 ) ) ( not ( = ?auto_52848 ?auto_52852 ) ) ( not ( = ?auto_52848 ?auto_52853 ) ) ( not ( = ?auto_52848 ?auto_52854 ) ) ( not ( = ?auto_52848 ?auto_52855 ) ) ( not ( = ?auto_52849 ?auto_52850 ) ) ( not ( = ?auto_52849 ?auto_52851 ) ) ( not ( = ?auto_52849 ?auto_52852 ) ) ( not ( = ?auto_52849 ?auto_52853 ) ) ( not ( = ?auto_52849 ?auto_52854 ) ) ( not ( = ?auto_52849 ?auto_52855 ) ) ( not ( = ?auto_52850 ?auto_52851 ) ) ( not ( = ?auto_52850 ?auto_52852 ) ) ( not ( = ?auto_52850 ?auto_52853 ) ) ( not ( = ?auto_52850 ?auto_52854 ) ) ( not ( = ?auto_52850 ?auto_52855 ) ) ( not ( = ?auto_52851 ?auto_52852 ) ) ( not ( = ?auto_52851 ?auto_52853 ) ) ( not ( = ?auto_52851 ?auto_52854 ) ) ( not ( = ?auto_52851 ?auto_52855 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_52852 ?auto_52853 ?auto_52854 )
      ( MAKE-6CRATE-VERIFY ?auto_52848 ?auto_52849 ?auto_52850 ?auto_52851 ?auto_52852 ?auto_52853 ?auto_52854 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_52912 - SURFACE
      ?auto_52913 - SURFACE
      ?auto_52914 - SURFACE
      ?auto_52915 - SURFACE
      ?auto_52916 - SURFACE
      ?auto_52917 - SURFACE
      ?auto_52918 - SURFACE
    )
    :vars
    (
      ?auto_52923 - HOIST
      ?auto_52921 - PLACE
      ?auto_52920 - PLACE
      ?auto_52919 - HOIST
      ?auto_52924 - SURFACE
      ?auto_52922 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_52923 ?auto_52921 ) ( SURFACE-AT ?auto_52917 ?auto_52921 ) ( CLEAR ?auto_52917 ) ( IS-CRATE ?auto_52918 ) ( not ( = ?auto_52917 ?auto_52918 ) ) ( AVAILABLE ?auto_52923 ) ( ON ?auto_52917 ?auto_52916 ) ( not ( = ?auto_52916 ?auto_52917 ) ) ( not ( = ?auto_52916 ?auto_52918 ) ) ( not ( = ?auto_52920 ?auto_52921 ) ) ( HOIST-AT ?auto_52919 ?auto_52920 ) ( not ( = ?auto_52923 ?auto_52919 ) ) ( AVAILABLE ?auto_52919 ) ( SURFACE-AT ?auto_52918 ?auto_52920 ) ( ON ?auto_52918 ?auto_52924 ) ( CLEAR ?auto_52918 ) ( not ( = ?auto_52917 ?auto_52924 ) ) ( not ( = ?auto_52918 ?auto_52924 ) ) ( not ( = ?auto_52916 ?auto_52924 ) ) ( TRUCK-AT ?auto_52922 ?auto_52921 ) ( ON ?auto_52913 ?auto_52912 ) ( ON ?auto_52914 ?auto_52913 ) ( ON ?auto_52915 ?auto_52914 ) ( ON ?auto_52916 ?auto_52915 ) ( not ( = ?auto_52912 ?auto_52913 ) ) ( not ( = ?auto_52912 ?auto_52914 ) ) ( not ( = ?auto_52912 ?auto_52915 ) ) ( not ( = ?auto_52912 ?auto_52916 ) ) ( not ( = ?auto_52912 ?auto_52917 ) ) ( not ( = ?auto_52912 ?auto_52918 ) ) ( not ( = ?auto_52912 ?auto_52924 ) ) ( not ( = ?auto_52913 ?auto_52914 ) ) ( not ( = ?auto_52913 ?auto_52915 ) ) ( not ( = ?auto_52913 ?auto_52916 ) ) ( not ( = ?auto_52913 ?auto_52917 ) ) ( not ( = ?auto_52913 ?auto_52918 ) ) ( not ( = ?auto_52913 ?auto_52924 ) ) ( not ( = ?auto_52914 ?auto_52915 ) ) ( not ( = ?auto_52914 ?auto_52916 ) ) ( not ( = ?auto_52914 ?auto_52917 ) ) ( not ( = ?auto_52914 ?auto_52918 ) ) ( not ( = ?auto_52914 ?auto_52924 ) ) ( not ( = ?auto_52915 ?auto_52916 ) ) ( not ( = ?auto_52915 ?auto_52917 ) ) ( not ( = ?auto_52915 ?auto_52918 ) ) ( not ( = ?auto_52915 ?auto_52924 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_52916 ?auto_52917 ?auto_52918 )
      ( MAKE-6CRATE-VERIFY ?auto_52912 ?auto_52913 ?auto_52914 ?auto_52915 ?auto_52916 ?auto_52917 ?auto_52918 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_52976 - SURFACE
      ?auto_52977 - SURFACE
      ?auto_52978 - SURFACE
      ?auto_52979 - SURFACE
      ?auto_52980 - SURFACE
      ?auto_52981 - SURFACE
      ?auto_52982 - SURFACE
    )
    :vars
    (
      ?auto_52985 - HOIST
      ?auto_52988 - PLACE
      ?auto_52984 - PLACE
      ?auto_52987 - HOIST
      ?auto_52986 - SURFACE
      ?auto_52983 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_52985 ?auto_52988 ) ( IS-CRATE ?auto_52982 ) ( not ( = ?auto_52981 ?auto_52982 ) ) ( not ( = ?auto_52980 ?auto_52981 ) ) ( not ( = ?auto_52980 ?auto_52982 ) ) ( not ( = ?auto_52984 ?auto_52988 ) ) ( HOIST-AT ?auto_52987 ?auto_52984 ) ( not ( = ?auto_52985 ?auto_52987 ) ) ( AVAILABLE ?auto_52987 ) ( SURFACE-AT ?auto_52982 ?auto_52984 ) ( ON ?auto_52982 ?auto_52986 ) ( CLEAR ?auto_52982 ) ( not ( = ?auto_52981 ?auto_52986 ) ) ( not ( = ?auto_52982 ?auto_52986 ) ) ( not ( = ?auto_52980 ?auto_52986 ) ) ( TRUCK-AT ?auto_52983 ?auto_52988 ) ( SURFACE-AT ?auto_52980 ?auto_52988 ) ( CLEAR ?auto_52980 ) ( LIFTING ?auto_52985 ?auto_52981 ) ( IS-CRATE ?auto_52981 ) ( ON ?auto_52977 ?auto_52976 ) ( ON ?auto_52978 ?auto_52977 ) ( ON ?auto_52979 ?auto_52978 ) ( ON ?auto_52980 ?auto_52979 ) ( not ( = ?auto_52976 ?auto_52977 ) ) ( not ( = ?auto_52976 ?auto_52978 ) ) ( not ( = ?auto_52976 ?auto_52979 ) ) ( not ( = ?auto_52976 ?auto_52980 ) ) ( not ( = ?auto_52976 ?auto_52981 ) ) ( not ( = ?auto_52976 ?auto_52982 ) ) ( not ( = ?auto_52976 ?auto_52986 ) ) ( not ( = ?auto_52977 ?auto_52978 ) ) ( not ( = ?auto_52977 ?auto_52979 ) ) ( not ( = ?auto_52977 ?auto_52980 ) ) ( not ( = ?auto_52977 ?auto_52981 ) ) ( not ( = ?auto_52977 ?auto_52982 ) ) ( not ( = ?auto_52977 ?auto_52986 ) ) ( not ( = ?auto_52978 ?auto_52979 ) ) ( not ( = ?auto_52978 ?auto_52980 ) ) ( not ( = ?auto_52978 ?auto_52981 ) ) ( not ( = ?auto_52978 ?auto_52982 ) ) ( not ( = ?auto_52978 ?auto_52986 ) ) ( not ( = ?auto_52979 ?auto_52980 ) ) ( not ( = ?auto_52979 ?auto_52981 ) ) ( not ( = ?auto_52979 ?auto_52982 ) ) ( not ( = ?auto_52979 ?auto_52986 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_52980 ?auto_52981 ?auto_52982 )
      ( MAKE-6CRATE-VERIFY ?auto_52976 ?auto_52977 ?auto_52978 ?auto_52979 ?auto_52980 ?auto_52981 ?auto_52982 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_53040 - SURFACE
      ?auto_53041 - SURFACE
      ?auto_53042 - SURFACE
      ?auto_53043 - SURFACE
      ?auto_53044 - SURFACE
      ?auto_53045 - SURFACE
      ?auto_53046 - SURFACE
    )
    :vars
    (
      ?auto_53049 - HOIST
      ?auto_53051 - PLACE
      ?auto_53050 - PLACE
      ?auto_53047 - HOIST
      ?auto_53048 - SURFACE
      ?auto_53052 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_53049 ?auto_53051 ) ( IS-CRATE ?auto_53046 ) ( not ( = ?auto_53045 ?auto_53046 ) ) ( not ( = ?auto_53044 ?auto_53045 ) ) ( not ( = ?auto_53044 ?auto_53046 ) ) ( not ( = ?auto_53050 ?auto_53051 ) ) ( HOIST-AT ?auto_53047 ?auto_53050 ) ( not ( = ?auto_53049 ?auto_53047 ) ) ( AVAILABLE ?auto_53047 ) ( SURFACE-AT ?auto_53046 ?auto_53050 ) ( ON ?auto_53046 ?auto_53048 ) ( CLEAR ?auto_53046 ) ( not ( = ?auto_53045 ?auto_53048 ) ) ( not ( = ?auto_53046 ?auto_53048 ) ) ( not ( = ?auto_53044 ?auto_53048 ) ) ( TRUCK-AT ?auto_53052 ?auto_53051 ) ( SURFACE-AT ?auto_53044 ?auto_53051 ) ( CLEAR ?auto_53044 ) ( IS-CRATE ?auto_53045 ) ( AVAILABLE ?auto_53049 ) ( IN ?auto_53045 ?auto_53052 ) ( ON ?auto_53041 ?auto_53040 ) ( ON ?auto_53042 ?auto_53041 ) ( ON ?auto_53043 ?auto_53042 ) ( ON ?auto_53044 ?auto_53043 ) ( not ( = ?auto_53040 ?auto_53041 ) ) ( not ( = ?auto_53040 ?auto_53042 ) ) ( not ( = ?auto_53040 ?auto_53043 ) ) ( not ( = ?auto_53040 ?auto_53044 ) ) ( not ( = ?auto_53040 ?auto_53045 ) ) ( not ( = ?auto_53040 ?auto_53046 ) ) ( not ( = ?auto_53040 ?auto_53048 ) ) ( not ( = ?auto_53041 ?auto_53042 ) ) ( not ( = ?auto_53041 ?auto_53043 ) ) ( not ( = ?auto_53041 ?auto_53044 ) ) ( not ( = ?auto_53041 ?auto_53045 ) ) ( not ( = ?auto_53041 ?auto_53046 ) ) ( not ( = ?auto_53041 ?auto_53048 ) ) ( not ( = ?auto_53042 ?auto_53043 ) ) ( not ( = ?auto_53042 ?auto_53044 ) ) ( not ( = ?auto_53042 ?auto_53045 ) ) ( not ( = ?auto_53042 ?auto_53046 ) ) ( not ( = ?auto_53042 ?auto_53048 ) ) ( not ( = ?auto_53043 ?auto_53044 ) ) ( not ( = ?auto_53043 ?auto_53045 ) ) ( not ( = ?auto_53043 ?auto_53046 ) ) ( not ( = ?auto_53043 ?auto_53048 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_53044 ?auto_53045 ?auto_53046 )
      ( MAKE-6CRATE-VERIFY ?auto_53040 ?auto_53041 ?auto_53042 ?auto_53043 ?auto_53044 ?auto_53045 ?auto_53046 ) )
  )

)

